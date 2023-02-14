# mazadat-image-slider

image slider component

## Installation

```sh
npm install mazadat-image-slider
```

## Usage

```js
import { ImageSliderView } from "mazadat-image-slider";

// ...
const onItemSelected = event => {
    console.log(event.nativeEvent['data']);
};

<ImageSliderView 
        onChange={onItemSelected}
        data={['image1Url,image2Url,image3Url']}
        color="#000000"
        style={styles.box} />

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MAZADAT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
