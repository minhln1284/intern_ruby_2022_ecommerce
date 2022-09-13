// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

import jquery from 'jquery';
window.jQuery = jquery;
window.$ = jquery;

Rails.start()
require('jquery')
require('js/jquery.easing.min')
require('js/jquery.flexslider')
require('js/jquery.waypoints.min')
require('js/bootstrap')
require('js/easy-responsive-tabs')
require('js/minicart.min')
require('js/move-top')
require('js/scroll')
require('js/custom')
require('js/responsive-tab')
require('js/run-slider')
require('js/responsiveslides.min')
import "../stylesheets/application"
Turbolinks.start()
ActiveStorage.start()

require('admin/scripts')
require('admin/all')
global.toastr = require("toastr")
require('admin/index.min')
