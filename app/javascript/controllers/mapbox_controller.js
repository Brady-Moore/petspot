import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="mapbox"
export default class extends Controller {
  static values = {
    apiKey: String,
    lat: Number,
    lng: Number,
    name: String,
  };

  connect() {
    if (!this.apiKeyValue) return;

    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.lngValue, this.latValue],
      zoom: 14,
      attributionControl: true,
    });

    // Controls
    this.map.addControl(new mapboxgl.NavigationControl(), "top-right");

    // Marker + popup
    const popup = new mapboxgl.Popup({ offset: 24 }).setText(this.nameValue);
    new mapboxgl.Marker({ color: "#E67E22" }).setLngLat([this.lngValue, this.latValue]).setPopup(popup).addTo(this.map);
  }

  disconnect() {
    if (this.map) this.map.remove();
  }
}
