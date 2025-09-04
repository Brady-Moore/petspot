import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";

// Connects to data-controller="pic-with-location"
export default class extends Controller {

  static targets = ['map', 'lat', 'lng', 'prefecture', 'city']
  static values = {
    apiKey: String,
  }

  connect() {
    console.log("connect")
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.userLngValue || 139.6917, this.userLatValue || 35.6895],
      zoom: 15,
      attributionControl: true,
    })
  }

  getCoordinates(e) {
    const imgInput = e.currentTarget
    const formData = new FormData(imgInput.form)
    fetch('/get_coords', {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.head.querySelector('meta[name="csrf-token"]').content,
        "Accept": "application/json"
      },
      body: formData
    }).then(response=>response.json())
    .then(data=>{
      console.log(data)
      if (data.lng && data.lat) {
        this.addPin(data)
        this.latTarget.value = data.lat
        this.lngTarget.value = data.lng
        this.updateAddress(data)
      }
    })
  }

  addPin(location) {
    console.log('pin')
    this.mapTarget.classList.remove("d-none")
    const marker = new mapboxgl.Marker().setLngLat([location.lng, location.lat])
    marker.addTo(this.map)
    this.map.setCenter(location)
  }

  async updateAddress(coords) {
    const response = await fetch(`https://api.mapbox.com/search/geocode/v6/reverse?longitude=${coords.lng}&latitude=${coords.lat}&access_token=${this.apiKeyValue}&language=en`)
    const dataLocation = await response.json()
    console.log(dataLocation)
    const city = dataLocation.features[0].properties.context.place.name
    const prefecture = dataLocation.features[0].properties.context.region.name
    this.cityTarget.value = city
    this.prefectureTarget.value = prefecture
  }
}
