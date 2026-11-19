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
