import { Controller } from "stimulus"
import Uppy from '@uppy/core'
import Dashboard from '@uppy/dashboard'
import XHRUpload from '@uppy/xhr-upload'

export default class extends Controller {
  connect() {
    this.uploadSubmit = document.querySelector('.upload-submit')
    this.parentForm = document.getElementById(this.data.get('parentForm'))
    this.blacklist = JSON.parse( this.data.get('blacklist') || '[]' )

    // this.uploadSubmit.style.visibility='hidden'
    this.initialize_uppy()
  }

  initialize_uppy() {
    var uppy = Uppy({
      id: 'someid',
      autoProceed: true,
      allowMultipleUploads: true,
      onBeforeFileAdded: (currentFile, files) => {
        let filename = currentFile.name
        let isBlacklisted = this.blacklist.includes(filename)

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
    .on('complete', result => this.onUppyComplete(result) )
  }

  onUppyComplete(result) {
    // this.uploadSubmit.style.visibility='visible'
    result.successful.forEach(success => {
      this.parentForm.appendChild(this.createHiddenFileInput(success))
    })
  }

  createHiddenFileInput(success) {
    let uploadedFileData = JSON.stringify(success.response.body)
    let input = document.createElement("input")
    input.setAttribute("type", "hidden")
    input.setAttribute("name", "work_version[file_resources_attributes][][file]")
    input.setAttribute("value", uploadedFileData)

    return input
  }
}
