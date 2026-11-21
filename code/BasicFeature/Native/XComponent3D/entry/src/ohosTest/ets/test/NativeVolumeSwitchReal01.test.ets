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

import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ProbeResult, probeSetNeedSoftKeyboard } from 'libnativerender.so';
import { probeRegisterUIInputEventCallback } from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 开关型桶的点缀套件：volume 桶逐个断言入参回显，
 * 这里改用开-关-开的状态序列与注册码一致性断言，验证开关切换不残留。
 */
export default function nativeVolumeSwitchReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeSwitchReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeSwitchReal0001
         * @tc.number SUB_XCOMPONENT3D_SWITCHREAL_0001
         * @tc.desc   Real: the on-off-on sequence keeps echoing the requested keyboard state
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeSwitchReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitchReal0001 begin');
            const on: ProbeResult = probeSetNeedSoftKeyboard(1);
            const off: ProbeResult = probeSetNeedSoftKeyboard(0);
            const restored: ProbeResult = probeSetNeedSoftKeyboard(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(on.value), String(1));
            expect(on.value).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(off.value), String(0));
            expect(off.value).assertEqual(0);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(restored.value), String(on.value));
            expect(restored.value).assertEqual(on.value);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(restored.code), String(on.code));
            expect(restored.code).assertEqual(on.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitchReal0001 end');
        })

        /**
         * @tc.name   testVolumeSwitchReal0002
         * @tc.number SUB_XCOMPONENT3D_SWITCHREAL_0002
         * @tc.desc   Real: touch, mouse and key registration share one code and echo their own type
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeSwitchReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitchReal0002 begin');
            const touch: ProbeResult = probeRegisterUIInputEventCallback(1);
            const mouse: ProbeResult = probeRegisterUIInputEventCallback(3);
            const key: ProbeResult = probeRegisterUIInputEventCallback(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(touch.value), String(1));
            expect(touch.value).assertEqual(1);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(mouse.value), String(3));
            expect(mouse.value).assertEqual(3);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(key.value), String(4));
            expect(key.value).assertEqual(4);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(mouse.code), String(touch.code));
            expect(mouse.code).assertEqual(touch.code);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(key.code), String(touch.code));
            expect(key.code).assertEqual(touch.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitchReal0002 end');
        })

    })
}
