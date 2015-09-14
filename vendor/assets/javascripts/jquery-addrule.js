/*!
 * jquery.addrule.js 0.0.1 - https://gist.github.com/yckart/5563717/
 * Add css-rules to an existing stylesheet.
 *
 * @see http://stackoverflow.com/a/16507264/1250044
 *
 * Copyright (c) 2013 Yannick Albert (http://yckart.com)
 * Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php).
 * 2013/05/12
 **/

(function ($) {

    window.addRule = function (selector, styles, sheet) {

        styles = (function (styles) {
            if (typeof styles === "string") return styles;
            var clone = "";
            for (var p in styles) {
                if (styles.hasOwnProperty(p)) {
                    var val = styles[p];
                    p = p.replace(/([A-Z])/g, "-$1").toLowerCase(); // convert to dash-case
                    clone += p + ":" + (p === "content" ? '"' + val + '"' : val) + "; ";
                }
            }
            return clone;
        }(styles));
        sheet = sheet || document.styleSheets[document.styleSheets.length - 1];

        if (sheet.insertRule) sheet.insertRule(selector + " {" + styles + "}", sheet.cssRules.length);
        else if (sheet.addRule) sheet.addRule(selector, styles);

        return this;

    };

    if ($) $.fn.addRule = function (styles, sheet) {
        addRule(this.selector, styles, sheet);
        return this;
    };

}(window.jQuery));
