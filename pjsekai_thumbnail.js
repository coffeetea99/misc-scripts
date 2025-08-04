let divs = document.getElementsByClassName('MuiCardMedia-root')
function getURL(div) {
  const styleString = window.getComputedStyle(div)['backgroundImage']
  return styleString.substring(styleString.indexOf('"') + 1, styleString.lastIndexOf('"'))
}
let urlList = Array.from(divs).map(div => getURL(div))

let nameList = Array.from(document.querySelectorAll('h6.MuiTypography-subtitle1')).filter((element, index) => index % 2 === 0).map(element => element.innerText)

function downLoader(fileUrl, fileName) {
  fetch(fileUrl)
  .then(response => response.blob())
  .then(blob => {
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = fileName;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(a.href);
  })
  .catch(error => console.error("Download failed:", error));
}

const timer = ms => new Promise(res => setTimeout(res, ms))

async function load () {
  for (let index = 0; index < urlList.length; index++) {
    downLoader(urlList[index], (index + 1) + '_' + nameList[index])
    await timer(500);
  }
}

load();
