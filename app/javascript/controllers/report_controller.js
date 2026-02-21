import { Controller } from "@hotwired/stimulus"
import {
  Chart,
  PieController,
  BarController,
  BarElement,
  LineController,
  LineElement,
  PointElement,
  ArcElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend
} from "chart.js"

Chart.register(
  PieController,
  BarController,
  LineController,
  BarElement,
  LineElement,
  PointElement,
  ArcElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend
)

export default class extends Controller {
  static values = {
    type: String,
    otype: String,
    labels: Array,
    income: Array,
    expense: Array
  }

  connect() {
    this.initializeChart()
  }

  initializeChart() {
    
    if (!Chart) return

    this.chart = new Chart(this.element, {
      type: this.typeValue || "bar",
      data: {
        labels: this.labelsValue,
        datasets: this.getDataSet()
      },
      options: this.options()
    })
  }

  getDataSet() {
    let datasetArray = []
    const otype = (this.otypeValue || "").trim()

    if (otype !== "income") {
      datasetArray.push(this.buildDataset(
        "Витрати",
        this.expenseValue,
        "#e546a3"
      ))
    }

    if (otype !== "expense") {
      datasetArray.push(this.buildDataset(
        "Дохід",
        this.incomeValue,
        "#4f46e5"
      ))
    }

    return datasetArray
  }

  buildDataset(label, data, color) {
    if (this.typeValue === "line") {
      return {
        label,
        data,
        borderColor: color,
        backgroundColor: color,
        borderWidth: 2,
        pointBackgroundColor: color,
        tension: 0.3,
        fill: false
      }
    }

    return {
      label,
      data,
      backgroundColor: color
    }
  }

  isLine() {
    return this.typeValue === "line"
  }


  disconnect() {
    this.chart?.destroy()
  }

  options() {
    if (this.typeValue === "pie" || this.typeValue === "doughnut") {
      return { responsive: true }
    }

    return {
      responsive: true,
      scales: {
        y: { beginAtZero: true }
      }
    }
  }

  colors() {
    return [
      "#4f46e5",
      "#c046e5",
      "#46e57b",
      "#e546a3",
      "#46dae5",
      "#e59846"
    ]
  }
}
