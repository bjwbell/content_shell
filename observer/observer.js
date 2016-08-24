// observer.js

function logImpression() { console.log("intersection observer"); }

function isVisible(boundingClientRect, intersectionRect) {
  return ((intersectionRect.width * intersectionRect.height) /
          (boundingClientRect.width * boundingClientRect.height) >= 0.5);
}

function processChanges(changes) {
    changes.forEach(function(changeRecord) {
        console.log("intersection observer - changeRecord:", changeRecord); 
        var element = changeRecord.target;
        element.isVisible = isVisible(changeRecord.boundingClientRect, changeRecord.intersectionRect);
        console.log("intersection observer - isVisible:", element.isVisible); 
    });
}

var observer = new IntersectionObserver(
  processChanges,
    { threshold: [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9] } 
);

var observerId = document.querySelector('#observerId');
observer.observe(observerId);
