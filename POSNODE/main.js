const {app, BrowserWindow,Menu} = require('electron')
const path = require('path')
const url = require('url')


const template = [
  {
    label: 'Archivo',
    submenu:[
      {label:'Guardar'},
      {label:'Configuracion'},
      {type:'separator'},
      {label:'Salir'},
    ]
  },
  {
    label: 'Compra',
    submenu:[
      {label:'Nueva'}
    ]
  },
  {
    label: 'Productos',
    submenu:[
      {label:'Agregar'},
    {label:'Borrar'}
  ]

  },
  {
    label: 'Ayuda',
    submenu: [
      {label:'Acerca de ...'}
    ]
  }
]

var menu = Menu.buildFromTemplate(template);
Menu.setApplicationMenu(menu);
let win

function createWindow () {
  win = new BrowserWindow({width: 800, height: 600})

  win.loadURL(url.format({
    pathname: path.join(__dirname, 'index.html'),
    protocol: 'file:',
    slashes: true
  }))
  //win.webContents.openDevTools()

  win.on('closed', () => {
    win = null
  })
}

app.on('ready', createWindow)
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  if (win === null) {
    createWindow()
  }
})
