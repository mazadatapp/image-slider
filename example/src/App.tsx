import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { ImageSliderView } from 'image-slider';

export default function App() {
  const onItemSelected = event => {
    console.log(event.nativeEvent['data']);
};
  return (
    <View style={styles.container}>
      <ImageSliderView 
        onChange={onItemSelected}
        data={['https://imgs.search.brave.com/QvTo_4uwbiM9g4RSaTeqFGwF0DmrvgCFYIfLvptDbkA/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9kaWdp/dGFsc3lub3BzaXMu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE0LzA2L3N1cGVy/Y2FyLXdhbGxwYXBl/cnMtYnVnYXR0aS0z/LmpwZw',
              'https://imgs.search.brave.com/IV8DqnaLPaTbwKAjxX_VNLcKwtE4pUil4S_gZ68GBR4/rs:fit:1200:1200:1/g:ce/aHR0cDovL3dhbGx1/cC5uZXQvd3AtY29u/dGVudC91cGxvYWRz/LzIwMTYvMDMvMTIv/MzQxNzYyLUF1ZGlf/UjgtY2FyLXZlaGlj/bGUtU3VwZXJfQ2Fy/LXJlZF9jYXJzLmpw/Zw',
              'https://imgs.search.brave.com/QvTo_4uwbiM9g4RSaTeqFGwF0DmrvgCFYIfLvptDbkA/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9kaWdp/dGFsc3lub3BzaXMu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE0LzA2L3N1cGVy/Y2FyLXdhbGxwYXBl/cnMtYnVnYXR0aS0z/LmpwZw']}
        color="#000000"
        style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: "100%",
    height: "30%",
    marginVertical: 20,
  },
});
