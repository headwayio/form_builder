# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-sortable", to: "https://ga.jspm.io/npm:stimulus-sortable@4.1.1/dist/stimulus-sortable.mjs", preload: true
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js"
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"
pin "stimulus-dropdown", to: "https://ga.jspm.io/npm:stimulus-dropdown@2.1.0/dist/stimulus-dropdown.mjs", preload: true
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.12.0/dist/hotkeys.esm.js"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js"
pin "stimulus-rails-nested-form", to: "https://ga.jspm.io/npm:stimulus-rails-nested-form@4.1.0/dist/stimulus-rails-nested-form.mjs", preload: true
pin "libphonenumber-js", to: "https://ga.jspm.io/npm:libphonenumber-js@1.10.47/index.js"
pin "stimulus-rails-autosave", to: "https://ga.jspm.io/npm:stimulus-rails-autosave@4.1.1/dist/stimulus-rails-autosave.es.js", preload: true
pin "lodash.debounce", to: "https://ga.jspm.io/npm:lodash.debounce@4.0.8/index.js"
