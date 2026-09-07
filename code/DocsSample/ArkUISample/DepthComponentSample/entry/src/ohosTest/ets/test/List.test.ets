import { DepthComponent2DTest } from './DepthComponent2D.test';
import { DepthComponent3DTest } from './DepthComponent3D.test';
import { DepthComponentDepthTest } from './DepthComponentDepth.test';
import { DepthComponentNDCTest } from './DepthComponentNDC.test';
import { DepthComponentCropTest } from './DepthComponentCrop.test';

export default function testsuite() {
  DepthComponent2DTest();
  DepthComponent3DTest();
  DepthComponentDepthTest();
  DepthComponentNDCTest();
  DepthComponentCropTest();
}
