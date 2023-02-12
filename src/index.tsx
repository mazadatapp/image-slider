import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'image-slider' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type ImageSliderProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'ImageSliderView';

export const ImageSliderView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<ImageSliderProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
