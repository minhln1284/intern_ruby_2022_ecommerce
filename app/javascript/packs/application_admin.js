import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
import "bootstrap"
import "../stylesheets/application"

Rails.start()
require('admin/scripts')
require('admin/all')
Turbolinks.start()
ActiveStorage.start()
global.toastr = require("toastr")
require('admin/index.min')
