import { Controller } from "stimulus"
import Uppy from '@uppy/core'
import Dashboard from '@uppy/dashboard'
import XHRUpload from '@uppy/xhr-upload'

export default class extends Controller {

  connect() {
    document.querySelector('.upload-submit').style.visibility='hidden'
    this.initialize_uppy()
  }

  initialize_uppy() {
    let blacklist = JSON.parse( this.data.get('blacklist') || '[]' )

    var uppy = Uppy({
      id: 'someid',
      autoProceed: true,
      allowMultipleUploads: true,
      onBeforeFileAdded: (currentFile, files) => {
        let filename = currentFile.name
        let isBlacklisted = blacklist.includes(filename)

        if ( isBlacklisted ) {
          uppy.info(`Error: ${filename} already exists in this version`, 'error', 10000)
          return false
        }
      }
    })
    .use(Dashboard, {
      id: 'dashboard',
      target: this.element,
      inline: 'true',
      showProgressDetails: true
    }).use(XHRUpload, {
      endpoint: '/upload', // Shrine's upload endpoint
    })

    var hiddenFileInput = function(success) {
      var uploadedFileData = JSON.stringify(success.response.body)
      var input = document.createElement("input")
      input.setAttribute("type", "hidden")
      input.setAttribute("name", "work_version[file_resources_attributes][][file]")
      input.setAttribute("value", uploadedFileData)

      return input
    }

    uppy.on('complete', result => {
      document.querySelector('.upload-submit').style.visibility='visible'
      result.successful.forEach(function(success) {
        document.getElementsByTagName('form')[0].appendChild(hiddenFileInput(success))
      })
    })
  }
}
