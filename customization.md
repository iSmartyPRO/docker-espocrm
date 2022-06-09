# Кастомный стиль для CRM

## Добавляем конфигурацию в файл: custom/Espo/Custom/Resources/metadata/app/client.json
```
{
    "cssList": [
            "client/custom/css/custom.css"
    ]
}

```

## Далее создаем файл стилей: client/custom/css/custom.css
```
#login .logo-container {
    height: 120px;
    margin: auto;
}
#login.panel>.panel-heading, .navbar-inverse {
    background-color: #1E3058;
}
#login.panel>.panel-heading {
    padding: 50px;
}
#btn-login{
    background-color: #1E3058;
    font-size: 1.3em;
    height: 50px;
    width: 100%;
}

ul.navbar-nav .active, #navbar .nav.navbar-nav.navbar-right {
    background: #224287 !important;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
    background: #224287 !important;
}
.list-container .pull-left, .list-container img {
    width: 70px;
    height: 70px;
}
.list-container img.avatar {
    border-radius: 100%;
}
.stream-head-text-container, .stream-date-container, .stream-post-container {
    padding-left: 80px;
}
.list-row {
    min-height: 100px;
}
.stream-attachments-container {
    padding-left: 80px;
}
.list-categories-column {
    display: none;
}
.category-item {
    text-align: center;
}
.category-item a {
    font-size: 18px;
    white-space: normal;
    text-decoration: none;
}
.category-item a:hover, .text-muted:hover {
    color: #224287;
}
.category-item .fa-folder {
    font-size: 30px;
    display: block;
}
.list-main-column {
    padding-top: 50px;
    width:100%;
}


/* Customize Table */
table.tbl1 {
    border: 2px solid #1C6EA4;
    width: 100%;
    border-collapse: collapse;
  }
  table.tbl1 td, table.tbl1 th {
    border: 2px solid #1C6EA4;
    padding: 7px 7px;
  }
  table.tbl1 tbody td {
    font-size: 14px;
  }
  table.tbl1 thead th {
    font-size: 15px;
    font-weight: bold;
    color: #FFFFFF;
    text-align: center;

    background: #1C6EA4;
    background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    border-bottom: 2px solid #1C6EA4;

  }

  table.tbl1 .tblBlue {
    font-size: 15px;
    font-weight: bold;
    color: #FFFFFF;

    background: #1C6EA4;
    background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
    border-bottom: 2px solid #1C6EA4;
  }

```
