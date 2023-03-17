// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import DataTable from 'datatables.net-bs5';

window.DataTable = DataTable
document.addEventListener("turbo:load", () => {
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
    ele = document.getElementById('example')
    let table = new DataTable('#example');
  })

  document.addEventListener('DOMContentLoaded', function () {
 
    });