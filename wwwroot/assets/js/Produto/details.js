// Show more button
var allOSB = [];
var mxh = '';

window.onload = function() {
  
  allOSB = document.getElementsByClassName("text-more");
  
  if (allOSB.length > 0) {
    mxh = window.getComputedStyle(allOSB[0]).getPropertyValue('max-height');
    mxh = parseInt(mxh.replace('px', ''));
    
    
    for (var i = 0; i < allOSB.length; i++) {
      var el = document.createElement("a");
      el.innerHTML = "Ver mais";
      el.setAttribute('class', 'read-more')
      
      insertAfter(allOSB[i], el);
    }
  }

  
  var readMoreButtons = document.getElementsByClassName("read-more");
  for (var i = 0; i < readMoreButtons.length; i++) {
    readMoreButtons[i].addEventListener("click", function() { 
      revealThis(this);
    }, false);
  }
  
  
  updateReadMore();
}


window.onresize = function() {
  updateReadMore();
}


function updateReadMore() {
  if (allOSB.length > 0) {
    for (var i = 0; i < allOSB.length; i++) {
      if (allOSB[i].scrollHeight > mxh) {
        if (allOSB[i].hasAttribute("style")) {
          updateHeight(allOSB[i]);
        }
        allOSB[i].nextElementSibling.className = "read-more nav-link  mx-3 mx-md-0";
      } else {
        allOSB[i].nextElementSibling.className = "read-more hide";
      }
    }
  }
}

function revealThis(current) {
  var el = current.previousElementSibling;
  if (el.hasAttribute("style")) {
    current.innerHTML = "Ver mais";
    el.removeAttribute("style");
  } else {
    updateHeight(el);
    current.innerHTML = "Ver menos";
  }
}

function updateHeight(el) {
  el.style.maxHeight = el.scrollHeight + "px";
}

// thanks to karim79 for this function
// http://stackoverflow.com/a/4793630/5667951
function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}