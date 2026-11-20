/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { display, window } from '@kit.ArkUI';
import { launchHome, stopHome } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const WINDOW_WAIT_ATTEMPTS: number = 100;

let home: UIAbility | undefined = undefined;
let cachedWindow: window.Window | undefined = undefined;

async function mainWindow(): Promise<window.Window> {
  const current: window.Window | undefined = cachedWindow;
  if (current !== undefined) {
    return current;
  }
  if (home === undefined) {
    home = await launchHome();
  }
  for (let attempt: number = 0; attempt < WINDOW_WAIT_ATTEMPTS; attempt++) {
    const uiContext: UIContext | undefined = AppStorage.get('uiContext');
    if (uiContext !== undefined && uiContext.isAvailable()) {
      const windowName: string | undefined = uiContext.getWindowName();
      if (windowName !== undefined) {
        try {
          const created: window.Window = window.findWindow(windowName);
          cachedWindow = created;
          return created;
        } catch (error) {
        }
      }
    }
    await paceTurn();
  }
  throw new Error('Main window was not created');
}

export default function windowDisplayMatrixTest() {
  describe('WindowDisplayMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0001
     * @tc.name      testWindowDisplay0001
     * @tc.desc      Window rect width is positive with probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.width > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width <= 8192).assertTrue();
      logCase('testWindowDisplay0001', 'window display check 1');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0002
     * @tc.name      testWindowDisplay0002
     * @tc.desc      Window rect width is positive with probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.width > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height <= 8192).assertTrue();
      logCase('testWindowDisplay0002', 'window display check 2');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0003
     * @tc.name      testWindowDisplay0003
     * @tc.desc      Window rect width is positive with probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.width > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI >= 64).assertTrue();
      logCase('testWindowDisplay0003', 'window display check 3');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0004
     * @tc.name      testWindowDisplay0004
     * @tc.desc      Window rect width is positive with probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.width > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels <= 16).assertTrue();
      logCase('testWindowDisplay0004', 'window display check 4');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0005
     * @tc.name      testWindowDisplay0005
     * @tc.desc      Window rect height is positive with probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.rotation)).assertTrue();
      logCase('testWindowDisplay0005', 'window display check 5');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0006
     * @tc.name      testWindowDisplay0006
     * @tc.desc      Window rect height is positive with probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.width)).assertTrue();
      logCase('testWindowDisplay0006', 'window display check 6');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0007
     * @tc.name      testWindowDisplay0007
     * @tc.desc      Window rect height is positive with probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.height)).assertTrue();
      logCase('testWindowDisplay0007', 'window display check 7');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0008
     * @tc.name      testWindowDisplay0008
     * @tc.desc      Window rect height is positive with probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.id)).assertTrue();
      logCase('testWindowDisplay0008', 'window display check 8');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0009
     * @tc.name      testWindowDisplay0009
     * @tc.desc      Window rect width fits the display with probe 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.width <= disp.width).assertTrue();
      expect(disp.width * disp.height > 0).assertTrue();
      logCase('testWindowDisplay0009', 'window display check 9');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0010
     * @tc.name      testWindowDisplay0010
     * @tc.desc      Window rect width fits the display with probe 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.width <= disp.width).assertTrue();
      expect(disp.densityDPI <= 2000).assertTrue();
      logCase('testWindowDisplay0010', 'window display check 10');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0011
     * @tc.name      testWindowDisplay0011
     * @tc.desc      Window rect width fits the display with probe 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.width <= disp.width).assertTrue();
      expect(disp.width >= (await mainWindow()).getWindowProperties().windowRect.width).assertTrue();
      logCase('testWindowDisplay0011', 'window display check 11');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0012
     * @tc.name      testWindowDisplay0012
     * @tc.desc      Window rect width fits the display with probe 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.width <= disp.width).assertTrue();
      expect(disp.height >= (await mainWindow()).getWindowProperties().windowRect.height).assertTrue();
      logCase('testWindowDisplay0012', 'window display check 12');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0013
     * @tc.name      testWindowDisplay0013
     * @tc.desc      Window rect height fits the display with probe 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.height <= disp.height).assertTrue();
      expect(disp.rotation < 4).assertTrue();
      logCase('testWindowDisplay0013', 'window display check 13');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0014
     * @tc.name      testWindowDisplay0014
     * @tc.desc      Window rect height fits the display with probe 14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.height <= disp.height).assertTrue();
      expect(disp.densityPixels >= 1).assertTrue();
      logCase('testWindowDisplay0014', 'window display check 14');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0015
     * @tc.name      testWindowDisplay0015
     * @tc.desc      Window rect height fits the display with probe 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.height <= disp.height).assertTrue();
      expect(disp.width > 200).assertTrue();
      logCase('testWindowDisplay0015', 'window display check 15');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0016
     * @tc.name      testWindowDisplay0016
     * @tc.desc      Window rect height fits the display with probe 16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(props.windowRect.height <= disp.height).assertTrue();
      expect(disp.height > 200).assertTrue();
      logCase('testWindowDisplay0016', 'window display check 16');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0017
     * @tc.name      testWindowDisplay0017
     * @tc.desc      Window rect origin is non negative with probe 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.left >= 0).assertTrue();
      expect(props.windowRect.top >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id < 100).assertTrue();
      logCase('testWindowDisplay0017', 'window display check 17');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0018
     * @tc.name      testWindowDisplay0018
     * @tc.desc      Window rect origin is non negative with probe 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.left >= 0).assertTrue();
      expect(props.windowRect.top >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(typeof disp.alive).assertEqual('boolean');
      logCase('testWindowDisplay0018', 'window display check 18');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0019
     * @tc.name      testWindowDisplay0019
     * @tc.desc      Window rect origin is non negative with probe 19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.left >= 0).assertTrue();
      expect(props.windowRect.top >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0).assertTrue();
      logCase('testWindowDisplay0019', 'window display check 19');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0020
     * @tc.name      testWindowDisplay0020
     * @tc.desc      Window rect origin is non negative with probe 20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.windowRect.left >= 0).assertTrue();
      expect(props.windowRect.top >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      logCase('testWindowDisplay0020', 'window display check 20');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0021
     * @tc.name      testWindowDisplay0021
     * @tc.desc      Window drawable rect width fits the window with probe 21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width <= props.windowRect.width).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width !== 0).assertTrue();
      logCase('testWindowDisplay0021', 'window display check 21');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0022
     * @tc.name      testWindowDisplay0022
     * @tc.desc      Window drawable rect width fits the window with probe 22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width <= props.windowRect.width).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height !== 0).assertTrue();
      logCase('testWindowDisplay0022', 'window display check 22');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0023
     * @tc.name      testWindowDisplay0023
     * @tc.desc      Window drawable rect width fits the window with probe 23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width <= props.windowRect.width).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width <= 8192).assertTrue();
      logCase('testWindowDisplay0023', 'window display check 23');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0024
     * @tc.name      testWindowDisplay0024
     * @tc.desc      Window drawable rect width fits the window with probe 24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width <= props.windowRect.width).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height <= 8192).assertTrue();
      logCase('testWindowDisplay0024', 'window display check 24');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0025
     * @tc.name      testWindowDisplay0025
     * @tc.desc      Window drawable rect height fits the window with probe 25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.height <= props.windowRect.height).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI >= 64).assertTrue();
      logCase('testWindowDisplay0025', 'window display check 25');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0026
     * @tc.name      testWindowDisplay0026
     * @tc.desc      Window drawable rect height fits the window with probe 26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.height <= props.windowRect.height).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels <= 16).assertTrue();
      logCase('testWindowDisplay0026', 'window display check 26');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0027
     * @tc.name      testWindowDisplay0027
     * @tc.desc      Window drawable rect height fits the window with probe 27
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.height <= props.windowRect.height).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.rotation)).assertTrue();
      logCase('testWindowDisplay0027', 'window display check 27');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0028
     * @tc.name      testWindowDisplay0028
     * @tc.desc      Window drawable rect height fits the window with probe 28
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.height <= props.windowRect.height).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.width)).assertTrue();
      logCase('testWindowDisplay0028', 'window display check 28');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0029
     * @tc.name      testWindowDisplay0029
     * @tc.desc      Window drawable rect is not empty with probe 29
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width > 0).assertTrue();
      expect(props.drawableRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.height)).assertTrue();
      logCase('testWindowDisplay0029', 'window display check 29');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0030
     * @tc.name      testWindowDisplay0030
     * @tc.desc      Window drawable rect is not empty with probe 30
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width > 0).assertTrue();
      expect(props.drawableRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.id)).assertTrue();
      logCase('testWindowDisplay0030', 'window display check 30');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0031
     * @tc.name      testWindowDisplay0031
     * @tc.desc      Window drawable rect is not empty with probe 31
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width > 0).assertTrue();
      expect(props.drawableRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width * disp.height > 0).assertTrue();
      logCase('testWindowDisplay0031', 'window display check 31');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0032
     * @tc.name      testWindowDisplay0032
     * @tc.desc      Window drawable rect is not empty with probe 32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.drawableRect.width > 0).assertTrue();
      expect(props.drawableRect.height > 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI <= 2000).assertTrue();
      logCase('testWindowDisplay0032', 'window display check 32');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0033
     * @tc.name      testWindowDisplay0033
     * @tc.desc      Window display id is non negative with probe 33
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.displayId !== undefined).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width >= (await mainWindow()).getWindowProperties().windowRect.width).assertTrue();
      logCase('testWindowDisplay0033', 'window display check 33');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0034
     * @tc.name      testWindowDisplay0034
     * @tc.desc      Window display id is non negative with probe 34
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.displayId !== undefined).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height >= (await mainWindow()).getWindowProperties().windowRect.height).assertTrue();
      logCase('testWindowDisplay0034', 'window display check 34');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0035
     * @tc.name      testWindowDisplay0035
     * @tc.desc      Window display id is non negative with probe 35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.displayId !== undefined).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation < 4).assertTrue();
      logCase('testWindowDisplay0035', 'window display check 35');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0036
     * @tc.name      testWindowDisplay0036
     * @tc.desc      Window display id is non negative with probe 36
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(props.displayId !== undefined).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels >= 1).assertTrue();
      logCase('testWindowDisplay0036', 'window display check 36');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0037
     * @tc.name      testWindowDisplay0037
     * @tc.desc      Window layout full screen flag is boolean with probe 37
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isLayoutFullScreen).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 200).assertTrue();
      logCase('testWindowDisplay0037', 'window display check 37');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0038
     * @tc.name      testWindowDisplay0038
     * @tc.desc      Window layout full screen flag is boolean with probe 38
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isLayoutFullScreen).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 200).assertTrue();
      logCase('testWindowDisplay0038', 'window display check 38');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0039
     * @tc.name      testWindowDisplay0039
     * @tc.desc      Window layout full screen flag is boolean with probe 39
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isLayoutFullScreen).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id < 100).assertTrue();
      logCase('testWindowDisplay0039', 'window display check 39');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0040
     * @tc.name      testWindowDisplay0040
     * @tc.desc      Window layout full screen flag is boolean with probe 40
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isLayoutFullScreen).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(typeof disp.alive).assertEqual('boolean');
      logCase('testWindowDisplay0040', 'window display check 40');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0041
     * @tc.name      testWindowDisplay0041
     * @tc.desc      Window transparency flag is boolean with probe 41
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isTransparent).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0).assertTrue();
      logCase('testWindowDisplay0041', 'window display check 41');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0042
     * @tc.name      testWindowDisplay0042
     * @tc.desc      Window transparency flag is boolean with probe 42
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isTransparent).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      logCase('testWindowDisplay0042', 'window display check 42');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0043
     * @tc.name      testWindowDisplay0043
     * @tc.desc      Window transparency flag is boolean with probe 43
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isTransparent).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width !== 0).assertTrue();
      logCase('testWindowDisplay0043', 'window display check 43');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0044
     * @tc.name      testWindowDisplay0044
     * @tc.desc      Window transparency flag is boolean with probe 44
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.isTransparent).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height !== 0).assertTrue();
      logCase('testWindowDisplay0044', 'window display check 44');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0045
     * @tc.name      testWindowDisplay0045
     * @tc.desc      Window focus flag is boolean with probe 45
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.focusable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width <= 8192).assertTrue();
      logCase('testWindowDisplay0045', 'window display check 45');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0046
     * @tc.name      testWindowDisplay0046
     * @tc.desc      Window focus flag is boolean with probe 46
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.focusable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height <= 8192).assertTrue();
      logCase('testWindowDisplay0046', 'window display check 46');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0047
     * @tc.name      testWindowDisplay0047
     * @tc.desc      Window focus flag is boolean with probe 47
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.focusable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI >= 64).assertTrue();
      logCase('testWindowDisplay0047', 'window display check 47');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0048
     * @tc.name      testWindowDisplay0048
     * @tc.desc      Window focus flag is boolean with probe 48
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.focusable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels <= 16).assertTrue();
      logCase('testWindowDisplay0048', 'window display check 48');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0049
     * @tc.name      testWindowDisplay0049
     * @tc.desc      Window touch flag is boolean with probe 49
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.touchable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.rotation)).assertTrue();
      logCase('testWindowDisplay0049', 'window display check 49');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0050
     * @tc.name      testWindowDisplay0050
     * @tc.desc      Window touch flag is boolean with probe 50
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.touchable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.width)).assertTrue();
      logCase('testWindowDisplay0050', 'window display check 50');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0051
     * @tc.name      testWindowDisplay0051
     * @tc.desc      Window touch flag is boolean with probe 51
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.touchable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.height)).assertTrue();
      logCase('testWindowDisplay0051', 'window display check 51');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0052
     * @tc.name      testWindowDisplay0052
     * @tc.desc      Window touch flag is boolean with probe 52
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const win: window.Window = await mainWindow();
      const props: window.WindowProperties = win.getWindowProperties();
      expect(typeof props.touchable).assertEqual('boolean');
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.id)).assertTrue();
      logCase('testWindowDisplay0052', 'window display check 52');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0053
     * @tc.name      testWindowDisplay0053
     * @tc.desc      Display width is positive with probe 53
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 0).assertTrue();
      expect(disp.width * disp.height > 0).assertTrue();
      logCase('testWindowDisplay0053', 'window display check 53');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0054
     * @tc.name      testWindowDisplay0054
     * @tc.desc      Display width is positive with probe 54
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 0).assertTrue();
      expect(disp.densityDPI <= 2000).assertTrue();
      logCase('testWindowDisplay0054', 'window display check 54');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0055
     * @tc.name      testWindowDisplay0055
     * @tc.desc      Display width is positive with probe 55
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 0).assertTrue();
      expect(disp.width >= (await mainWindow()).getWindowProperties().windowRect.width).assertTrue();
      logCase('testWindowDisplay0055', 'window display check 55');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0056
     * @tc.name      testWindowDisplay0056
     * @tc.desc      Display width is positive with probe 56
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 0).assertTrue();
      expect(disp.height >= (await mainWindow()).getWindowProperties().windowRect.height).assertTrue();
      logCase('testWindowDisplay0056', 'window display check 56');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0057
     * @tc.name      testWindowDisplay0057
     * @tc.desc      Display height is positive with probe 57
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 0).assertTrue();
      expect(disp.rotation < 4).assertTrue();
      logCase('testWindowDisplay0057', 'window display check 57');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0058
     * @tc.name      testWindowDisplay0058
     * @tc.desc      Display height is positive with probe 58
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 0).assertTrue();
      expect(disp.densityPixels >= 1).assertTrue();
      logCase('testWindowDisplay0058', 'window display check 58');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0059
     * @tc.name      testWindowDisplay0059
     * @tc.desc      Display height is positive with probe 59
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 0).assertTrue();
      expect(disp.width > 200).assertTrue();
      logCase('testWindowDisplay0059', 'window display check 59');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0060
     * @tc.name      testWindowDisplay0060
     * @tc.desc      Display height is positive with probe 60
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 0).assertTrue();
      expect(disp.height > 200).assertTrue();
      logCase('testWindowDisplay0060', 'window display check 60');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0061
     * @tc.name      testWindowDisplay0061
     * @tc.desc      Display density dpi is positive with probe 61
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      expect(disp.id < 100).assertTrue();
      logCase('testWindowDisplay0061', 'window display check 61');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0062
     * @tc.name      testWindowDisplay0062
     * @tc.desc      Display density dpi is positive with probe 62
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      expect(typeof disp.alive).assertEqual('boolean');
      logCase('testWindowDisplay0062', 'window display check 62');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0063
     * @tc.name      testWindowDisplay0063
     * @tc.desc      Display density dpi is positive with probe 63
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      expect(disp.rotation >= 0).assertTrue();
      logCase('testWindowDisplay0063', 'window display check 63');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0064
     * @tc.name      testWindowDisplay0064
     * @tc.desc      Display density dpi is positive with probe 64
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      expect(disp.densityDPI > 0).assertTrue();
      logCase('testWindowDisplay0064', 'window display check 64');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0065
     * @tc.name      testWindowDisplay0065
     * @tc.desc      Display density pixels are positive with probe 65
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels > 0).assertTrue();
      expect(disp.width !== 0).assertTrue();
      logCase('testWindowDisplay0065', 'window display check 65');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0066
     * @tc.name      testWindowDisplay0066
     * @tc.desc      Display density pixels are positive with probe 66
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels > 0).assertTrue();
      expect(disp.height !== 0).assertTrue();
      logCase('testWindowDisplay0066', 'window display check 66');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0067
     * @tc.name      testWindowDisplay0067
     * @tc.desc      Display density pixels are positive with probe 67
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels > 0).assertTrue();
      expect(disp.width <= 8192).assertTrue();
      logCase('testWindowDisplay0067', 'window display check 67');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0068
     * @tc.name      testWindowDisplay0068
     * @tc.desc      Display density pixels are positive with probe 68
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels > 0).assertTrue();
      expect(disp.height <= 8192).assertTrue();
      logCase('testWindowDisplay0068', 'window display check 68');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0069
     * @tc.name      testWindowDisplay0069
     * @tc.desc      Display rotation is a quadrant with probe 69
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0 && disp.rotation <= 3).assertTrue();
      expect(disp.densityDPI >= 64).assertTrue();
      logCase('testWindowDisplay0069', 'window display check 69');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0070
     * @tc.name      testWindowDisplay0070
     * @tc.desc      Display rotation is a quadrant with probe 70
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0 && disp.rotation <= 3).assertTrue();
      expect(disp.densityPixels <= 16).assertTrue();
      logCase('testWindowDisplay0070', 'window display check 70');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0071
     * @tc.name      testWindowDisplay0071
     * @tc.desc      Display rotation is a quadrant with probe 71
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0 && disp.rotation <= 3).assertTrue();
      expect(Number.isInteger(disp.rotation)).assertTrue();
      logCase('testWindowDisplay0071', 'window display check 71');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0072
     * @tc.name      testWindowDisplay0072
     * @tc.desc      Display rotation is a quadrant with probe 72
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0 && disp.rotation <= 3).assertTrue();
      expect(Number.isInteger(disp.width)).assertTrue();
      logCase('testWindowDisplay0072', 'window display check 72');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0073
     * @tc.name      testWindowDisplay0073
     * @tc.desc      Display is alive with probe 73
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.alive).assertTrue();
      expect(Number.isInteger(disp.height)).assertTrue();
      logCase('testWindowDisplay0073', 'window display check 73');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0074
     * @tc.name      testWindowDisplay0074
     * @tc.desc      Display is alive with probe 74
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.alive).assertTrue();
      expect(Number.isInteger(disp.id)).assertTrue();
      logCase('testWindowDisplay0074', 'window display check 74');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0075
     * @tc.name      testWindowDisplay0075
     * @tc.desc      Display is alive with probe 75
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.alive).assertTrue();
      expect(disp.width * disp.height > 0).assertTrue();
      logCase('testWindowDisplay0075', 'window display check 75');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0076
     * @tc.name      testWindowDisplay0076
     * @tc.desc      Display is alive with probe 76
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.alive).assertTrue();
      expect(disp.densityDPI <= 2000).assertTrue();
      logCase('testWindowDisplay0076', 'window display check 76');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0077
     * @tc.name      testWindowDisplay0077
     * @tc.desc      Display id is non negative with probe 77
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id >= 0).assertTrue();
      expect(disp.width >= (await mainWindow()).getWindowProperties().windowRect.width).assertTrue();
      logCase('testWindowDisplay0077', 'window display check 77');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0078
     * @tc.name      testWindowDisplay0078
     * @tc.desc      Display id is non negative with probe 78
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id >= 0).assertTrue();
      expect(disp.height >= (await mainWindow()).getWindowProperties().windowRect.height).assertTrue();
      logCase('testWindowDisplay0078', 'window display check 78');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0079
     * @tc.name      testWindowDisplay0079
     * @tc.desc      Display id is non negative with probe 79
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id >= 0).assertTrue();
      expect(disp.rotation < 4).assertTrue();
      logCase('testWindowDisplay0079', 'window display check 79');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0080
     * @tc.name      testWindowDisplay0080
     * @tc.desc      Display id is non negative with probe 80
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWindowDisplay0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id >= 0).assertTrue();
      expect(disp.densityPixels >= 1).assertTrue();
      logCase('testWindowDisplay0080', 'window display check 80');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0081
     * @tc.name      testWindowDisplay0081
     * @tc.desc      Avoid area TYPE_SYSTEM keeps non negative rects with probe 81
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width > 200).assertTrue();
      logCase('testWindowDisplay0081', 'window display check 81');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0082
     * @tc.name      testWindowDisplay0082
     * @tc.desc      Avoid area TYPE_SYSTEM keeps non negative rects with probe 82
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height > 200).assertTrue();
      logCase('testWindowDisplay0082', 'window display check 82');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0083
     * @tc.name      testWindowDisplay0083
     * @tc.desc      Avoid area TYPE_SYSTEM keeps non negative rects with probe 83
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.id < 100).assertTrue();
      logCase('testWindowDisplay0083', 'window display check 83');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0084
     * @tc.name      testWindowDisplay0084
     * @tc.desc      Avoid area TYPE_SYSTEM keeps non negative rects with probe 84
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(typeof disp.alive).assertEqual('boolean');
      logCase('testWindowDisplay0084', 'window display check 84');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0085
     * @tc.name      testWindowDisplay0085
     * @tc.desc      Avoid area TYPE_CUTOUT keeps non negative rects with probe 85
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.rotation >= 0).assertTrue();
      logCase('testWindowDisplay0085', 'window display check 85');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0086
     * @tc.name      testWindowDisplay0086
     * @tc.desc      Avoid area TYPE_CUTOUT keeps non negative rects with probe 86
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI > 0).assertTrue();
      logCase('testWindowDisplay0086', 'window display check 86');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0087
     * @tc.name      testWindowDisplay0087
     * @tc.desc      Avoid area TYPE_CUTOUT keeps non negative rects with probe 87
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width !== 0).assertTrue();
      logCase('testWindowDisplay0087', 'window display check 87');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0088
     * @tc.name      testWindowDisplay0088
     * @tc.desc      Avoid area TYPE_CUTOUT keeps non negative rects with probe 88
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height !== 0).assertTrue();
      logCase('testWindowDisplay0088', 'window display check 88');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0089
     * @tc.name      testWindowDisplay0089
     * @tc.desc      Avoid area TYPE_SYSTEM_GESTURE keeps non negative rects with probe 89
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width <= 8192).assertTrue();
      logCase('testWindowDisplay0089', 'window display check 89');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0090
     * @tc.name      testWindowDisplay0090
     * @tc.desc      Avoid area TYPE_SYSTEM_GESTURE keeps non negative rects with probe 90
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height <= 8192).assertTrue();
      logCase('testWindowDisplay0090', 'window display check 90');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0091
     * @tc.name      testWindowDisplay0091
     * @tc.desc      Avoid area TYPE_SYSTEM_GESTURE keeps non negative rects with probe 91
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI >= 64).assertTrue();
      logCase('testWindowDisplay0091', 'window display check 91');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0092
     * @tc.name      testWindowDisplay0092
     * @tc.desc      Avoid area TYPE_SYSTEM_GESTURE keeps non negative rects with probe 92
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityPixels <= 16).assertTrue();
      logCase('testWindowDisplay0092', 'window display check 92');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0093
     * @tc.name      testWindowDisplay0093
     * @tc.desc      Avoid area TYPE_NAVIGATION_INDICATOR keeps non negative rects with probe 93
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.rotation)).assertTrue();
      logCase('testWindowDisplay0093', 'window display check 93');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0094
     * @tc.name      testWindowDisplay0094
     * @tc.desc      Avoid area TYPE_NAVIGATION_INDICATOR keeps non negative rects with probe 94
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.width)).assertTrue();
      logCase('testWindowDisplay0094', 'window display check 94');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0095
     * @tc.name      testWindowDisplay0095
     * @tc.desc      Avoid area TYPE_NAVIGATION_INDICATOR keeps non negative rects with probe 95
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.height)).assertTrue();
      logCase('testWindowDisplay0095', 'window display check 95');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0096
     * @tc.name      testWindowDisplay0096
     * @tc.desc      Avoid area TYPE_NAVIGATION_INDICATOR keeps non negative rects with probe 96
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(Number.isInteger(disp.id)).assertTrue();
      logCase('testWindowDisplay0096', 'window display check 96');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0097
     * @tc.name      testWindowDisplay0097
     * @tc.desc      Avoid area TYPE_KEYBOARD keeps non negative rects with probe 97
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width * disp.height > 0).assertTrue();
      logCase('testWindowDisplay0097', 'window display check 97');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0098
     * @tc.name      testWindowDisplay0098
     * @tc.desc      Avoid area TYPE_KEYBOARD keeps non negative rects with probe 98
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.densityDPI <= 2000).assertTrue();
      logCase('testWindowDisplay0098', 'window display check 98');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0099
     * @tc.name      testWindowDisplay0099
     * @tc.desc      Avoid area TYPE_KEYBOARD keeps non negative rects with probe 99
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.width >= (await mainWindow()).getWindowProperties().windowRect.width).assertTrue();
      logCase('testWindowDisplay0099', 'window display check 99');
    });
    /**
     * @tc.number    SUB_PREHTTP_WINDOW_0100
     * @tc.name      testWindowDisplay0100
     * @tc.desc      Avoid area TYPE_KEYBOARD keeps non negative rects with probe 100
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWindowDisplay0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const win: window.Window = await mainWindow();
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      expect(area.topRect.width >= 0).assertTrue();
      expect(area.topRect.height >= 0).assertTrue();
      expect(area.topRect.left + area.topRect.width >= 0).assertTrue();
      const disp: display.Display = display.getDefaultDisplaySync();
      expect(disp.height >= (await mainWindow()).getWindowProperties().windowRect.height).assertTrue();
      logCase('testWindowDisplay0100', 'window display check 100');
    });
  });
}
