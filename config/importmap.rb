# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.4.1/dist/chart.js"
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4

pin "@popperjs/core",
    to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/dist/esm/index.js",
    preload: true

pin "bootstrap",
    to: "https://ga.jspm.io/npm:bootstrap@5.3.3/dist/js/bootstrap.esm.js",
    preload: true

pin_all_from "app/javascript/controllers", under: "controllers"
