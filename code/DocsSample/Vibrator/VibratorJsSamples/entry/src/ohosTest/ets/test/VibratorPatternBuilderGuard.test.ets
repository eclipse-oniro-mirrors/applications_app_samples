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
import { vibrator } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorBuilderGuard';

interface TransientRejection {
  label: string;
  time: number;
  options: vibrator.TransientParam;
}

interface ContinuousRejection {
  label: string;
  time: number;
  duration: number;
  options: vibrator.ContinuousParam;
}

export default function vibratorPatternBuilderGuard(): void {
  describe('VibratorPatternBuilderGuard', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_GUARD_0001
     * @tc.name testVibratorBuilderGuard0001
     * @tc.desc SDK短事件分别拒绝负数、越界和极大时间，以及非法强度、频率和通道，返回401。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderGuard0001', 0, (): void => {
      const rows: TransientRejection[] = [
        { label: 'time negative', time: -1, options: {} },
        { label: 'time above maximum', time: 1800001, options: {} },
        { label: 'time extreme', time: Number.MAX_SAFE_INTEGER, options: {} },
        { label: 'intensity negative', time: 25, options: { intensity: -1 } },
        { label: 'intensity above maximum', time: 25, options: { intensity: 101 } },
        { label: 'frequency negative', time: 25, options: { frequency: -1 } },
        { label: 'frequency above maximum', time: 25, options: { frequency: 101 } },
        { label: 'index negative', time: 25, options: { index: -1 } },
        { label: 'index above maximum', time: 25, options: { index: 3 } }
      ];
      const codes: number[] = [];
      for (const row of rows) {
        const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
        let code: number = 0;
        try {
          builder.addTransientEvent(row.time, row.options);
        } catch (error) {
          code = Number((error as BusinessError).code);
        }
        hilog.info(DOMAIN, TAG, '%{public}s code=%{public}d', row.label, code);
        codes.push(code);
      }
      const timeCodes: string = codes.slice(0, 3).join(',');
      hilog.info(DOMAIN, TAG, 'Transient invalid time codes=%{public}s', timeCodes);
      expect(timeCodes).assertEqual('401,401,401');
      const intensityCodes: string = codes.slice(3, 5).join(',');
      hilog.info(DOMAIN, TAG, 'Transient invalid intensity codes=%{public}s', intensityCodes);
      expect(intensityCodes).assertEqual('401,401');
      const frequencyCodes: string = codes.slice(5, 7).join(',');
      hilog.info(DOMAIN, TAG, 'Transient invalid frequency codes=%{public}s', frequencyCodes);
      expect(frequencyCodes).assertEqual('401,401');
      const indexCodes: string = codes.slice(7, 9).join(',');
      hilog.info(DOMAIN, TAG, 'Transient invalid index codes=%{public}s', indexCodes);
      expect(indexCodes).assertEqual('401,401');
    });

    /**
     * @tc.number SUB_VIBRATOR_GUARD_0002
     * @tc.name testVibratorBuilderGuard0002
     * @tc.desc SDK长事件分别拒绝非法时间、零及越界时长、强度、频率和通道，返回401。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderGuard0002', 0, (): void => {
      const rows: ContinuousRejection[] = [
        { label: 'time negative', time: -1, duration: 15, options: {} },
        { label: 'time above maximum', time: 1800001, duration: 15, options: {} },
        { label: 'time extreme', time: Number.MAX_SAFE_INTEGER, duration: 15, options: {} },
        { label: 'duration zero', time: 25, duration: 0, options: {} },
        { label: 'duration negative', time: 25, duration: -1, options: {} },
        { label: 'duration above maximum', time: 25, duration: 5001, options: {} },
        { label: 'duration extreme', time: 25, duration: Number.MAX_SAFE_INTEGER, options: {} },
        { label: 'intensity negative', time: 25, duration: 15, options: { intensity: -1 } },
        { label: 'intensity above maximum', time: 25, duration: 15, options: { intensity: 101 } },
        { label: 'frequency negative', time: 25, duration: 15, options: { frequency: -1 } },
        { label: 'frequency above maximum', time: 25, duration: 15, options: { frequency: 101 } },
        { label: 'index negative', time: 25, duration: 15, options: { index: -1 } },
        { label: 'index above maximum', time: 25, duration: 15, options: { index: 3 } }
      ];
      const codes: number[] = [];
      for (const row of rows) {
        const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
        let code: number = 0;
        try {
          builder.addContinuousEvent(row.time, row.duration, row.options);
        } catch (error) {
          code = Number((error as BusinessError).code);
        }
        hilog.info(DOMAIN, TAG, '%{public}s code=%{public}d', row.label, code);
        codes.push(code);
      }
      const timeCodes: string = codes.slice(0, 3).join(',');
      hilog.info(DOMAIN, TAG, 'Continuous invalid time codes=%{public}s', timeCodes);
      expect(timeCodes).assertEqual('401,401,401');
      const durationCodes: string = codes.slice(3, 7).join(',');
      hilog.info(DOMAIN, TAG, 'Continuous invalid duration codes=%{public}s', durationCodes);
      expect(durationCodes).assertEqual('401,401,401,401');
      const intensityCodes: string = codes.slice(7, 9).join(',');
      hilog.info(DOMAIN, TAG, 'Continuous invalid intensity codes=%{public}s', intensityCodes);
      expect(intensityCodes).assertEqual('401,401');
      const frequencyCodes: string = codes.slice(9, 11).join(',');
      hilog.info(DOMAIN, TAG, 'Continuous invalid frequency codes=%{public}s', frequencyCodes);
      expect(frequencyCodes).assertEqual('401,401');
      const indexCodes: string = codes.slice(11, 13).join(',');
      hilog.info(DOMAIN, TAG, 'Continuous invalid index codes=%{public}s', indexCodes);
      expect(indexCodes).assertEqual('401,401');
    });

    /**
     * @tc.number SUB_VIBRATOR_GUARD_0003
     * @tc.name testVibratorBuilderGuard0003
     * @tc.desc SDK曲线分别拒绝增益低于0、高于1和频移低于负100、高于100，返回401。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderGuard0003', 0, (): void => {
      const invalidPoints: vibrator.VibratorCurvePoint[] = [
        { time: 100, intensity: -0.01, frequency: 0 },
        { time: 100, intensity: 1.01, frequency: 0 },
        { time: 100, intensity: 1, frequency: -101 },
        { time: 100, intensity: 1, frequency: 101 }
      ];
      const codes: number[] = [];
      for (const invalid of invalidPoints) {
        const points: vibrator.VibratorCurvePoint[] = [
          { time: 0, intensity: 0, frequency: 0 }, invalid,
          { time: 200, intensity: 1, frequency: 0 }, { time: 300, intensity: 0, frequency: 0 }
        ];
        const options: vibrator.ContinuousParam = { points: points };
        const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
        let code: number = 0;
        try {
          builder.addContinuousEvent(25, 300, options);
        } catch (error) {
          code = Number((error as BusinessError).code);
        }
        hilog.info(DOMAIN, TAG, 'Curve rejection intensity=%{public}s frequency=%{public}s code=%{public}d',
          String(invalid.intensity), String(invalid.frequency), code);
        codes.push(code);
      }
      hilog.info(DOMAIN, TAG, 'Curve intensity below minimum code=%{public}d', codes[0]);
      expect(codes[0]).assertEqual(401);
      hilog.info(DOMAIN, TAG, 'Curve intensity above maximum code=%{public}d', codes[1]);
      expect(codes[1]).assertEqual(401);
      hilog.info(DOMAIN, TAG, 'Curve frequency below minimum code=%{public}d', codes[2]);
      expect(codes[2]).assertEqual(401);
      hilog.info(DOMAIN, TAG, 'Curve frequency above maximum code=%{public}d', codes[3]);
      expect(codes[3]).assertEqual(401);
    });
  });
}
