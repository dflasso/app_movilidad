# App Movilidad

App try to guide to different destinies in  [Universidad de las Fuerzas Armadas - ESPE](https://www.espe.edu.ec/) through the best route between two points.

Target of App are blind people.

## About code

### Initial Data
- **File Sections**: (assets/data/sections.json) It contains all destinies.
- **File Points**: (assets/data/points.json) It contains all coordinates necessaries.

### Models
Package: lib/src/model

- **SectionModel**: Mapping each object of Sections File.
- **PointModel**: Mapping each object of Points File.

### Components
Package: lib/src/components 

Contains generic  widgets

### Providers

Package: lib/src/providers
Each file cotains logic about information of App.

- **DestiniesProvider**: Handle Logic and provide data of Destinies
    + The next function load all destinies in memory.
```
  _loadDestiniesDefault() async {
    final String response =
        await rootBundle.loadString('assets/data/sections.json');
    _destinies = sectionModelLtsFromJson(response);
    notifyListeners();
  }
```


The next function find destinies by  parent section id
```
  List<SectionModel> getFilterDestinies(String parentSection) {
    return _destinies
        .where((element) => element.parentSection == parentSection)
        .toList();
  }
```

- **GeoLocalizationProvider**: Mapping each object of Points File.

