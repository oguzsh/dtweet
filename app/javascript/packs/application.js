// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import ReactRailsUJS from 'react_ujs';
import Utils from '../helpers/utils'
import "channels"

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);

Rails.start()
Turbolinks.start()
ActiveStorage.start()
Utils.setTimezone()
ReactRailsUJS.useContext(componentRequireContext);
