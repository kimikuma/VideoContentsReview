// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import 'jquery'
import 'popper.js'
import 'bootstrap'
import '../stylesheets/application'
import '../stylesheets/mystylesheet.css'
import Rails from '@rails/ujs';
Rails.start();
// Select2のJavaScriptをインポート
import 'select2';
// Select2のCSSをインポート
import 'select2/dist/css/select2.min.css';
