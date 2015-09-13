# https://github.com/vitalets/angular-xeditable/blob/master/src/js/directives/textarea.js

editableTextAngular = null
### @ngInject ###
editableTextAngular =  (editableDirectiveFactory) ->

  editableDirectiveFactory

    directiveName: 'editableTextAngular'

    inputTpl: "<div text-angular ta-toolbar-group-class=\"btn-group btn-group-xs\"
      ta-toolbar=\"[['h4'], ['bold', 'italics', 'underline'], ['ul', 'ol'],
      ['pre', 'quote'], ['insertLink']]\"></div>"

    addListeners: ->
      self = this
      self.parent.addListeners.call self
      # submit textarea by ctrl+enter even with buttons
      if self.single and self.buttons isnt 'no'
        self.autosubmit()

    autosubmit: ->
      self = this
      self.inputEl.bind 'keydown', (e) ->
        if (e.ctrlKey or e.metaKey) and e.keyCode is 13
          self.scope.$apply ->
            self.scope.$form.$submit()

angular
  .module 'app'
  .directive 'editableTextAngular', editableTextAngular
