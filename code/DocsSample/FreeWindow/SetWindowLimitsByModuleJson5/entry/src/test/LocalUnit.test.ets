/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const MIN_WINDOW_WIDTH: number = 400;
const MAX_WINDOW_WIDTH: number = 2560;
const MIN_WINDOW_HEIGHT: number = 200;
const MAX_WINDOW_HEIGHT: number = 1300;
const MIN_WINDOW_RATIO: number = 0.5;
const MAX_WINDOW_RATIO: number = 3.5;

export default function localUnitTest() {
  describe('localUnitTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * Verify module limit configuration 1.
     */
    it('ModuleJson5_param_1', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 2.
     */
    it('ModuleJson5_param_2', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 3.
     */
    it('ModuleJson5_param_3', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 4.
     */
    it('ModuleJson5_param_4', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 5.
     */
    it('ModuleJson5_param_5', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 6.
     */
    it('ModuleJson5_param_6', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 7.
     */
    it('ModuleJson5_param_7', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 8.
     */
    it('ModuleJson5_param_8', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 9.
     */
    it('ModuleJson5_param_9', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 10.
     */
    it('ModuleJson5_param_10', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 11.
     */
    it('ModuleJson5_param_11', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 12.
     */
    it('ModuleJson5_param_12', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 13.
     */
    it('ModuleJson5_param_13', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 14.
     */
    it('ModuleJson5_param_14', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 15.
     */
    it('ModuleJson5_param_15', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 16.
     */
    it('ModuleJson5_param_16', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 17.
     */
    it('ModuleJson5_param_17', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 18.
     */
    it('ModuleJson5_param_18', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 19.
     */
    it('ModuleJson5_param_19', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 20.
     */
    it('ModuleJson5_param_20', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 21.
     */
    it('ModuleJson5_param_21', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 22.
     */
    it('ModuleJson5_param_22', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 23.
     */
    it('ModuleJson5_param_23', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 24.
     */
    it('ModuleJson5_param_24', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 25.
     */
    it('ModuleJson5_param_25', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 26.
     */
    it('ModuleJson5_param_26', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 27.
     */
    it('ModuleJson5_param_27', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 28.
     */
    it('ModuleJson5_param_28', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 29.
     */
    it('ModuleJson5_param_29', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 30.
     */
    it('ModuleJson5_param_30', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 31.
     */
    it('ModuleJson5_param_31', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 32.
     */
    it('ModuleJson5_param_32', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 33.
     */
    it('ModuleJson5_param_33', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 34.
     */
    it('ModuleJson5_param_34', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 35.
     */
    it('ModuleJson5_param_35', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 36.
     */
    it('ModuleJson5_param_36', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 37.
     */
    it('ModuleJson5_param_37', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 38.
     */
    it('ModuleJson5_param_38', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 39.
     */
    it('ModuleJson5_param_39', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 40.
     */
    it('ModuleJson5_param_40', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 41.
     */
    it('ModuleJson5_param_41', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 42.
     */
    it('ModuleJson5_param_42', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 43.
     */
    it('ModuleJson5_param_43', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 44.
     */
    it('ModuleJson5_param_44', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 45.
     */
    it('ModuleJson5_param_45', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 46.
     */
    it('ModuleJson5_param_46', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 47.
     */
    it('ModuleJson5_param_47', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 48.
     */
    it('ModuleJson5_param_48', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 49.
     */
    it('ModuleJson5_param_49', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 50.
     */
    it('ModuleJson5_param_50', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 51.
     */
    it('ModuleJson5_param_51', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 52.
     */
    it('ModuleJson5_param_52', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 53.
     */
    it('ModuleJson5_param_53', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 54.
     */
    it('ModuleJson5_param_54', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 55.
     */
    it('ModuleJson5_param_55', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 56.
     */
    it('ModuleJson5_param_56', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 57.
     */
    it('ModuleJson5_param_57', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 58.
     */
    it('ModuleJson5_param_58', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 59.
     */
    it('ModuleJson5_param_59', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 60.
     */
    it('ModuleJson5_param_60', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 61.
     */
    it('ModuleJson5_param_61', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 62.
     */
    it('ModuleJson5_param_62', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 63.
     */
    it('ModuleJson5_param_63', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 64.
     */
    it('ModuleJson5_param_64', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 65.
     */
    it('ModuleJson5_param_65', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 66.
     */
    it('ModuleJson5_param_66', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 67.
     */
    it('ModuleJson5_param_67', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 68.
     */
    it('ModuleJson5_param_68', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 69.
     */
    it('ModuleJson5_param_69', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 70.
     */
    it('ModuleJson5_param_70', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 71.
     */
    it('ModuleJson5_param_71', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 72.
     */
    it('ModuleJson5_param_72', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 73.
     */
    it('ModuleJson5_param_73', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 74.
     */
    it('ModuleJson5_param_74', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 75.
     */
    it('ModuleJson5_param_75', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 76.
     */
    it('ModuleJson5_param_76', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 77.
     */
    it('ModuleJson5_param_77', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 78.
     */
    it('ModuleJson5_param_78', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 79.
     */
    it('ModuleJson5_param_79', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 80.
     */
    it('ModuleJson5_param_80', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 81.
     */
    it('ModuleJson5_param_81', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 82.
     */
    it('ModuleJson5_param_82', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 83.
     */
    it('ModuleJson5_param_83', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 84.
     */
    it('ModuleJson5_param_84', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 85.
     */
    it('ModuleJson5_param_85', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 86.
     */
    it('ModuleJson5_param_86', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 87.
     */
    it('ModuleJson5_param_87', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 88.
     */
    it('ModuleJson5_param_88', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 89.
     */
    it('ModuleJson5_param_89', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 90.
     */
    it('ModuleJson5_param_90', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 91.
     */
    it('ModuleJson5_param_91', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 92.
     */
    it('ModuleJson5_param_92', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 93.
     */
    it('ModuleJson5_param_93', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 94.
     */
    it('ModuleJson5_param_94', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 95.
     */
    it('ModuleJson5_param_95', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 96.
     */
    it('ModuleJson5_param_96', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 97.
     */
    it('ModuleJson5_param_97', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 98.
     */
    it('ModuleJson5_param_98', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 99.
     */
    it('ModuleJson5_param_99', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 100.
     */
    it('ModuleJson5_param_100', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 101.
     */
    it('ModuleJson5_param_101', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 102.
     */
    it('ModuleJson5_param_102', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 103.
     */
    it('ModuleJson5_param_103', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 104.
     */
    it('ModuleJson5_param_104', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 105.
     */
    it('ModuleJson5_param_105', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 106.
     */
    it('ModuleJson5_param_106', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 107.
     */
    it('ModuleJson5_param_107', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 108.
     */
    it('ModuleJson5_param_108', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 109.
     */
    it('ModuleJson5_param_109', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 110.
     */
    it('ModuleJson5_param_110', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 111.
     */
    it('ModuleJson5_param_111', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 112.
     */
    it('ModuleJson5_param_112', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 113.
     */
    it('ModuleJson5_param_113', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 114.
     */
    it('ModuleJson5_param_114', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 115.
     */
    it('ModuleJson5_param_115', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 116.
     */
    it('ModuleJson5_param_116', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 117.
     */
    it('ModuleJson5_param_117', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 118.
     */
    it('ModuleJson5_param_118', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 119.
     */
    it('ModuleJson5_param_119', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 120.
     */
    it('ModuleJson5_param_120', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 121.
     */
    it('ModuleJson5_param_121', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 122.
     */
    it('ModuleJson5_param_122', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 123.
     */
    it('ModuleJson5_param_123', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 124.
     */
    it('ModuleJson5_param_124', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 125.
     */
    it('ModuleJson5_param_125', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 126.
     */
    it('ModuleJson5_param_126', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 127.
     */
    it('ModuleJson5_param_127', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 128.
     */
    it('ModuleJson5_param_128', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 129.
     */
    it('ModuleJson5_param_129', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 130.
     */
    it('ModuleJson5_param_130', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 131.
     */
    it('ModuleJson5_param_131', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 132.
     */
    it('ModuleJson5_param_132', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 133.
     */
    it('ModuleJson5_param_133', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 134.
     */
    it('ModuleJson5_param_134', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 135.
     */
    it('ModuleJson5_param_135', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 136.
     */
    it('ModuleJson5_param_136', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 137.
     */
    it('ModuleJson5_param_137', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 138.
     */
    it('ModuleJson5_param_138', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 139.
     */
    it('ModuleJson5_param_139', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 140.
     */
    it('ModuleJson5_param_140', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 141.
     */
    it('ModuleJson5_param_141', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 142.
     */
    it('ModuleJson5_param_142', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 143.
     */
    it('ModuleJson5_param_143', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 144.
     */
    it('ModuleJson5_param_144', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 145.
     */
    it('ModuleJson5_param_145', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 146.
     */
    it('ModuleJson5_param_146', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 147.
     */
    it('ModuleJson5_param_147', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 148.
     */
    it('ModuleJson5_param_148', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 149.
     */
    it('ModuleJson5_param_149', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 150.
     */
    it('ModuleJson5_param_150', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 151.
     */
    it('ModuleJson5_param_151', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 152.
     */
    it('ModuleJson5_param_152', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 153.
     */
    it('ModuleJson5_param_153', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 154.
     */
    it('ModuleJson5_param_154', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 155.
     */
    it('ModuleJson5_param_155', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 156.
     */
    it('ModuleJson5_param_156', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 157.
     */
    it('ModuleJson5_param_157', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 158.
     */
    it('ModuleJson5_param_158', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 159.
     */
    it('ModuleJson5_param_159', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 160.
     */
    it('ModuleJson5_param_160', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 161.
     */
    it('ModuleJson5_param_161', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 162.
     */
    it('ModuleJson5_param_162', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 163.
     */
    it('ModuleJson5_param_163', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 164.
     */
    it('ModuleJson5_param_164', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 165.
     */
    it('ModuleJson5_param_165', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 166.
     */
    it('ModuleJson5_param_166', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 167.
     */
    it('ModuleJson5_param_167', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 168.
     */
    it('ModuleJson5_param_168', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 169.
     */
    it('ModuleJson5_param_169', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 170.
     */
    it('ModuleJson5_param_170', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 171.
     */
    it('ModuleJson5_param_171', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 172.
     */
    it('ModuleJson5_param_172', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 173.
     */
    it('ModuleJson5_param_173', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 174.
     */
    it('ModuleJson5_param_174', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 175.
     */
    it('ModuleJson5_param_175', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 176.
     */
    it('ModuleJson5_param_176', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 177.
     */
    it('ModuleJson5_param_177', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 178.
     */
    it('ModuleJson5_param_178', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 179.
     */
    it('ModuleJson5_param_179', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 180.
     */
    it('ModuleJson5_param_180', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 181.
     */
    it('ModuleJson5_param_181', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 182.
     */
    it('ModuleJson5_param_182', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 183.
     */
    it('ModuleJson5_param_183', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 184.
     */
    it('ModuleJson5_param_184', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 185.
     */
    it('ModuleJson5_param_185', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 186.
     */
    it('ModuleJson5_param_186', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 187.
     */
    it('ModuleJson5_param_187', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 188.
     */
    it('ModuleJson5_param_188', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 189.
     */
    it('ModuleJson5_param_189', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 190.
     */
    it('ModuleJson5_param_190', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 191.
     */
    it('ModuleJson5_param_191', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 192.
     */
    it('ModuleJson5_param_192', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 193.
     */
    it('ModuleJson5_param_193', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 194.
     */
    it('ModuleJson5_param_194', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 195.
     */
    it('ModuleJson5_param_195', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 196.
     */
    it('ModuleJson5_param_196', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 197.
     */
    it('ModuleJson5_param_197', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 198.
     */
    it('ModuleJson5_param_198', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 199.
     */
    it('ModuleJson5_param_199', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 200.
     */
    it('ModuleJson5_param_200', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 201.
     */
    it('ModuleJson5_param_201', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 202.
     */
    it('ModuleJson5_param_202', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 203.
     */
    it('ModuleJson5_param_203', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 204.
     */
    it('ModuleJson5_param_204', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 205.
     */
    it('ModuleJson5_param_205', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 206.
     */
    it('ModuleJson5_param_206', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 207.
     */
    it('ModuleJson5_param_207', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 208.
     */
    it('ModuleJson5_param_208', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 209.
     */
    it('ModuleJson5_param_209', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 210.
     */
    it('ModuleJson5_param_210', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 211.
     */
    it('ModuleJson5_param_211', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 212.
     */
    it('ModuleJson5_param_212', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 213.
     */
    it('ModuleJson5_param_213', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2000;
      const minHeight: number = 350;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 214.
     */
    it('ModuleJson5_param_214', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 2100;
      const minHeight: number = 400;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 215.
     */
    it('ModuleJson5_param_215', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 2200;
      const minHeight: number = 450;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 216.
     */
    it('ModuleJson5_param_216', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1500;
      const minHeight: number = 200;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 217.
     */
    it('ModuleJson5_param_217', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1600;
      const minHeight: number = 250;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 218.
     */
    it('ModuleJson5_param_218', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1700;
      const minHeight: number = 300;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 219.
     */
    it('ModuleJson5_param_219', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 1800;
      const minHeight: number = 350;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 220.
     */
    it('ModuleJson5_param_220', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 1900;
      const minHeight: number = 400;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 221.
     */
    it('ModuleJson5_param_221', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2000;
      const minHeight: number = 450;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 222.
     */
    it('ModuleJson5_param_222', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 2100;
      const minHeight: number = 200;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 223.
     */
    it('ModuleJson5_param_223', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 2200;
      const minHeight: number = 250;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 224.
     */
    it('ModuleJson5_param_224', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1500;
      const minHeight: number = 300;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 225.
     */
    it('ModuleJson5_param_225', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1600;
      const minHeight: number = 350;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 226.
     */
    it('ModuleJson5_param_226', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1700;
      const minHeight: number = 400;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(700);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 227.
     */
    it('ModuleJson5_param_227', 0, () => {
      const minWidth: number = 750;
      const maxWidth: number = 1800;
      const minHeight: number = 450;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(750);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 228.
     */
    it('ModuleJson5_param_228', 0, () => {
      const minWidth: number = 800;
      const maxWidth: number = 1900;
      const minHeight: number = 200;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(800);
      expect(maxWidth).assertEqual(1900);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 229.
     */
    it('ModuleJson5_param_229', 0, () => {
      const minWidth: number = 850;
      const maxWidth: number = 2000;
      const minHeight: number = 250;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(850);
      expect(maxWidth).assertEqual(2000);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 230.
     */
    it('ModuleJson5_param_230', 0, () => {
      const minWidth: number = 400;
      const maxWidth: number = 2100;
      const minHeight: number = 300;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(400);
      expect(maxWidth).assertEqual(2100);
      expect(minHeight).assertEqual(300);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 231.
     */
    it('ModuleJson5_param_231', 0, () => {
      const minWidth: number = 450;
      const maxWidth: number = 2200;
      const minHeight: number = 350;
      const maxHeight: number = 800;
      expect(minWidth).assertEqual(450);
      expect(maxWidth).assertEqual(2200);
      expect(minHeight).assertEqual(350);
      expect(maxHeight).assertEqual(800);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 232.
     */
    it('ModuleJson5_param_232', 0, () => {
      const minWidth: number = 500;
      const maxWidth: number = 1500;
      const minHeight: number = 400;
      const maxHeight: number = 900;
      expect(minWidth).assertEqual(500);
      expect(maxWidth).assertEqual(1500);
      expect(minHeight).assertEqual(400);
      expect(maxHeight).assertEqual(900);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 233.
     */
    it('ModuleJson5_param_233', 0, () => {
      const minWidth: number = 550;
      const maxWidth: number = 1600;
      const minHeight: number = 450;
      const maxHeight: number = 1000;
      expect(minWidth).assertEqual(550);
      expect(maxWidth).assertEqual(1600);
      expect(minHeight).assertEqual(450);
      expect(maxHeight).assertEqual(1000);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 234.
     */
    it('ModuleJson5_param_234', 0, () => {
      const minWidth: number = 600;
      const maxWidth: number = 1700;
      const minHeight: number = 200;
      const maxHeight: number = 1100;
      expect(minWidth).assertEqual(600);
      expect(maxWidth).assertEqual(1700);
      expect(minHeight).assertEqual(200);
      expect(maxHeight).assertEqual(1100);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 235.
     */
    it('ModuleJson5_param_235', 0, () => {
      const minWidth: number = 650;
      const maxWidth: number = 1800;
      const minHeight: number = 250;
      const maxHeight: number = 700;
      expect(minWidth).assertEqual(650);
      expect(maxWidth).assertEqual(1800);
      expect(minHeight).assertEqual(250);
      expect(maxHeight).assertEqual(700);
      expect(maxWidth >= minWidth).assertTrue();
      expect(maxHeight >= minHeight).assertTrue();
      expect(MIN_WINDOW_RATIO > 0 && MAX_WINDOW_RATIO > MIN_WINDOW_RATIO).assertTrue();
    });
    /**
     * Verify module limit configuration 236.
     */
    it('ModuleJson5_param_236', 0, () => {
      const minWidth: number = 700;
      const maxWidth: number = 1900;
      const minHeight: number = 300;
