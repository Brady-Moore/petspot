import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
    userLat: Number,
    userLng: Number,
    locations: Array
  };

  connect() {
    if (!this.apiKeyValue) return;

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.userLngValue || 139.6917, this.userLatValue || 35.6895],
      zoom: 12,
      attributionControl: true,
    })

    this.map.addControl(new mapboxgl.NavigationControl(), "top-right")

    const bounds = new mapboxgl.LngLatBounds()

    // Add user marker (blue)
    if (this.hasUserLatValue && this.hasUserLngValue) {
      new mapboxgl.Marker({ color: "#41a0ff" })
        .setLngLat([this.userLngValue, this.userLatValue])
        .setPopup(new mapboxgl.Popup({ offset: 24 }).setText("You are here"))
        .addTo(this.map)

      bounds.extend([this.userLngValue, this.userLatValue])
    }

    // Add nearby locations (orange)
    this.locationsValue.forEach((location) => {
      new mapboxgl.Marker({ color: "#fbce65" })
        .setLngLat([location.lng, location.lat])
        .setPopup(new mapboxgl.Popup({ offset: 24 }).setText(location.name))
        .addTo(this.map)

      bounds.extend([location.lng, location.lat])
    })

    // Auto-fit map to show everything
    if (!bounds.isEmpty()) {
      this.map.fitBounds(bounds, { padding: 50, maxZoom: 15 })
    }
  }

  disconnect() {
    if (this.map) this.map.remove()
  }
}

// gpt code
// import { Controller } from "@hotwired/stimulus"
// import mapboxgl from "mapbox-gl"

// // Connects to data-controller="mapbox"
// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     lat: Number,
//     lng: Number,
//     locations: Array, // Expect an array of {lat, lng, name}
//     name: String,
//   }

//   connect() {
//     if (!this.apiKeyValue) return

//     mapboxgl.accessToken = this.apiKeyValue

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v12",
//       center: [this.userLngValue || 139.6917, this.userLatValue || 35.6895],
//       zoom: 12,
//       attributionControl: true,
//     })

//     this.map.addControl(new mapboxgl.NavigationControl(), "top-right")

//     const bounds = new mapboxgl.LngLatBounds()

//     // Add user marker (blue)
//     if (this.hasUserLatValue && this.hasUserLngValue) {
//       new mapboxgl.Marker({ color: "blue" })
//         .setLngLat([this.userLngValue, this.userLatValue])
//         .setPopup(new mapboxgl.Popup({ offset: 24 }).setText("You are here"))
//         .addTo(this.map)

//       bounds.extend([this.userLngValue, this.userLatValue])
//     }

//     // Add nearby locations (orange)
//     this.locationsValue.forEach((location) => {
//       new mapboxgl.Marker({ color: "#E67E22" })
//         .setLngLat([location.lng, location.lat])
//         .setPopup(new mapboxgl.Popup({ offset: 24 }).setText(location.name))
//         .addTo(this.map)

//       bounds.extend([location.lng, location.lat])
//     })

//     // Auto-fit map to show everything
//     if (!bounds.isEmpty()) {
//       this.map.fitBounds(bounds, { padding: 50, maxZoom: 15 })
//     }
//   }

//   disconnect() {
//     if (this.map) this.map.remove()
//   }
// }
