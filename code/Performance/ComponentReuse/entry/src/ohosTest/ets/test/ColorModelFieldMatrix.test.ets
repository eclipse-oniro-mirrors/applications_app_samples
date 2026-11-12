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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { ColorModel } from '../../../main/ets/model/BasicDataSource';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ColorField]';

interface ColorCase {
  name: string;
  id: string;
  text: string;
  color: Color;
}

const COLOR_CASES: ColorCase[] = [
  { name: 'red', id: 'cf_red', text: 'text_red', color: Color.Red },
  { name: 'blue', id: 'cf_blue', text: 'text_blue', color: Color.Blue },
  { name: 'green', id: 'cf_green', text: 'text_green', color: Color.Green },
  { name: 'pink', id: 'cf_pink', text: 'text_pink', color: Color.Pink },
  { name: 'black', id: 'cf_black', text: 'text_black', color: Color.Black },
  { name: 'white', id: 'cf_white', text: 'text_white', color: Color.White }
];

export default function colorModelFieldMatrixTest() {
  describe('colorModelFieldMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    COLOR_CASES.forEach((c: ColorCase) => {
      it(`color_model_field_${c.name}`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', `color_model_field_${c.name} begin`);
        const data: ColorData = new ColorData();
        data.pushData(new ColorModel(c.id, c.text, c.color));
        data.pushData(new ColorModel(c.id + '_tail', c.text + '_tail', c.color));
        expect(data.totalCount()).assertEqual(2);
        const got: ColorModel = data.getData(0) as ColorModel;
        expect(got.id).assertEqual(c.id);
        expect(got.text).assertEqual(c.text);
        expect(got.color).assertEqual(c.color);
        hilog.info(DOMAIN, TAG, '%{public}s', `color_model_field_${c.name} end`);
      });
    });
  })
}
