// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
require('jquery')
require('js/bootstrap')
require('js/jquery.easing.min')
require('js/jquery.flexslider')
require('js/jquery.waypoints.min')
require('js/easy-responsive-tabs')
require('js/minicart.min')
require('js/move-top')
require('js/scroll')
require('js/responsive-tab')
require('js/run-slider')
require('js/responsiveslides.min')
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.toastr = require("toastr")
