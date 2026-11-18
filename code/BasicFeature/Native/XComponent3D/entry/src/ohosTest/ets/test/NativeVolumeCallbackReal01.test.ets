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
import {
    ProbeResult,
    probeRegisterOnFrameCallback,
    probeUnregisterOnFrameCallback,
    probeRegisterFocusEventCallback,
    probeRegisterBlurEventCallback,
    probeRegisterSurfaceShowCallback
} from 'libnativerender.so';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

/**
 * 注册回调状态机的配对点缀套件：volume 桶用重复调用验证返回码稳定，
 * 这里手写注册/注销配对、多接口依次注册与无前置注销三类语义。
 */
export default function nativeVolumeCallbackReal01Test() {
    resetYieldCounter();
    describe('NativeVolumeCallbackReal01', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        /**
         * @tc.name   testVolumeCallbackReal0001
         * @tc.number SUB_XCOMPONENT3D_CALLBACKREAL_0001
         * @tc.desc   on-frame register and unregister share the same native code domain
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCallbackReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0001 begin');
            const reg: ProbeResult = probeRegisterOnFrameCallback();
            hilog.info(DOMAIN, TAG, 'register code=%{public}s', String(reg.code));
            expect(reg.code >= -2 && reg.code <= 401).assertTrue();
            const unreg: ProbeResult = probeUnregisterOnFrameCallback();
            expect(unreg.code >= -2 && unreg.code <= 401).assertTrue();
            expect(unreg.code <= reg.code || reg.code < 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0001 end');
        })

        /**
         * @tc.name   testVolumeCallbackReal0002
         * @tc.number SUB_XCOMPONENT3D_CALLBACKREAL_0002
         * @tc.desc   consecutive registrations of three different callbacks all report native codes
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCallbackReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0002 begin');
            const focus: ProbeResult = probeRegisterFocusEventCallback();
            const blur: ProbeResult = probeRegisterBlurEventCallback();
            const show: ProbeResult = probeRegisterSurfaceShowCallback();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(focus.code), String(blur.code));
            expect(focus.code).assertEqual(blur.code);
            expect(blur.code).assertEqual(show.code);
            expect(focus.code >= -2 && focus.code <= 401).assertTrue();
            expect(focus.value % 1).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0002 end');
        })

        /**
         * @tc.name   testVolumeCallbackReal0003
         * @tc.number SUB_XCOMPONENT3D_CALLBACKREAL_0003
         * @tc.desc   a bare unregister without prior registration still reports a native code
         * @tc.type   Function
         * @tc.size   SmallTest
         * @tc.level  Level2
         */
        it('testVolumeCallbackReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0003 begin');
            const unreg: ProbeResult = probeUnregisterOnFrameCallback();
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                String(unreg.code >= -2), String(true));
            expect(unreg.code >= -2).assertTrue();
            expect(unreg.code <= 401).assertTrue();
            const again: ProbeResult = probeUnregisterOnFrameCallback();
            expect(again.code).assertEqual(unreg.code);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallbackReal0003 end');
        })

    })
}
