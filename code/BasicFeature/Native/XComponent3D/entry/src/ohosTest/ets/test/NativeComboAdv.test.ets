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

import {
    ProbeResult,
    getShapeIndex,
    probeRegisterCallback,
    probeRegisterMouseEventCallback,
    probeRegisterFocusEventCallback,
    probeRegisterBlurEventCallback,
    probeRegisterKeyEventCallback,
    probeRegisterKeyEventCallbackWithResult,
    probeRegisterOnFrameCallback,
    probeUnregisterOnFrameCallback,
    probeRegisterSurfaceShowCallback,
    probeRegisterSurfaceHideCallback,
    probeRegisterOnTouchInterceptCallback,
    probeRegisterUIInputEventCallback
} from 'libnativerender.so';
import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const RESULT_SUCCESS: number = 0;
const RESULT_FAILED: number = -1;
const RESULT_BAD_PARAMETER: number = -2;

const INPUT_TYPE_TOUCH: number = 1;
const INPUT_TYPE_MOUSE: number = 3;
const INPUT_TYPE_KEY: number = 4;

function isResultCode(code: number): boolean {
    return code === RESULT_SUCCESS || code === RESULT_FAILED || code === RESULT_BAD_PARAMETER;
}

// OH_NativeXComponent_RegisterUIInputEventCallback 返回 ArkUI 错误码域（0 / 401），
// 与 OH_NativeXComponent_ResultCode（0/-1/-2）不是同一集合，判定时两域并列承认。
const ARKUI_NO_ERROR: number = 0;
const ARKUI_PARAM_INVALID: number = 401;

function isArkuiErrorCode(code: number): boolean {
    return code === ARKUI_NO_ERROR || code === ARKUI_PARAM_INVALID;
}

function isValidCode(code: number): boolean {
    return isResultCode(code) || isArkuiErrorCode(code);
}

function bothValid(first: ProbeResult, second: ProbeResult): boolean {
    return isValidCode(first.code) && isValidCode(second.code);
}

export default function nativeComboAdvTest() {
    resetYieldCounter();
    describe('NativeComboAdvTest', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0161
         * @tc.name testCombo0161
         * @tc.desc 组合：基础回调与鼠标回调先后注册，形状索引不被回调注册改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0161 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterMouseEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0161 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0162
         * @tc.name testCombo0162
         * @tc.desc 组合：基础回调与获焦回调先后注册，两路返回码合法且形状不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0162 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterFocusEventCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(Number.isInteger(shapeBefore)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0162 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0163
         * @tc.name testCombo0163
         * @tc.desc 组合：基础回调与失焦回调先后注册，失焦注册不触碰形状状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0163 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterBlurEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0163 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0164
         * @tc.name testCombo0164
         * @tc.desc 组合：基础回调与按键回调先后注册，两条按键链路互不冲突
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0164 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex() >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0164 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0165
         * @tc.name testCombo0165
         * @tc.desc 组合：基础回调与带结果按键回调先后注册，注册结果码均合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0165 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeBefore >= 0).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0165 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0166
         * @tc.name testCombo0166
         * @tc.desc 组合：基础回调与逐帧回调先后注册，逐帧注册不改写形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0166 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0166 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0167
         * @tc.name testCombo0167
         * @tc.desc 组合：基础回调与逐帧注销先后执行，注销在前注册在后仍返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0167 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(getShapeIndex())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0167 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0168
         * @tc.name testCombo0168
         * @tc.desc 组合：基础回调与显示回调先后注册，显示链路注册不改变形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0168 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0168 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0169
         * @tc.name testCombo0169
         * @tc.desc 组合：基础回调与隐藏回调先后注册，隐藏链路注册不改变形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0169 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0169 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0170
         * @tc.name testCombo0170
         * @tc.desc 组合：基础回调与触摸拦截注册先后执行，拦截注册不改写形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0170 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0170 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0171
         * @tc.name testCombo0171
         * @tc.desc 组合：基础回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0171 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0171 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0172
         * @tc.name testCombo0172
         * @tc.desc 组合：基础回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0172 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0172 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0173
         * @tc.name testCombo0173
         * @tc.desc 组合：基础回调与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0173 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isArkuiErrorCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0173 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0174
         * @tc.name testCombo0174
         * @tc.desc 组合：鼠标回调与获焦回调先后注册，形状索引保持原值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0174 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterFocusEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0174 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0175
         * @tc.name testCombo0175
         * @tc.desc 组合：鼠标回调与失焦回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0175 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterBlurEventCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0175 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0176
         * @tc.name testCombo0176
         * @tc.desc 组合：鼠标回调与按键回调先后注册，鼠标与按键两条链路并存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0176 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0176 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0177
         * @tc.name testCombo0177
         * @tc.desc 组合：鼠标回调与带结果按键回调先后注册，返回码合法且形状不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0177 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0177 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0178
         * @tc.name testCombo0178
         * @tc.desc 组合：鼠标回调与逐帧回调先后注册，逐帧注册不改写形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0178 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0178 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0179
         * @tc.name testCombo0179
         * @tc.desc 组合：鼠标回调与逐帧注销先后执行，注销返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0179 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0179 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0180
         * @tc.name testCombo0180
         * @tc.desc 组合：鼠标回调与显示回调先后注册，显示链路注册不改变形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0180 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0180 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0181
         * @tc.name testCombo0181
         * @tc.desc 组合：鼠标回调与隐藏回调先后注册，隐藏链路注册不改变形状
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0181 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(getShapeIndex())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0181 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0182
         * @tc.name testCombo0182
         * @tc.desc 组合：鼠标回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0182 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0182 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0183
         * @tc.name testCombo0183
         * @tc.desc 组合：鼠标回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0183 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0183 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0184
         * @tc.name testCombo0184
         * @tc.desc 组合：鼠标回调与鼠标类输入事件注册先后执行，同域注册不互相覆盖状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0184 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0184 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0185
         * @tc.name testCombo0185
         * @tc.desc 组合：鼠标回调与按键类输入事件注册先后执行，跨域注册不互相覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0185 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterMouseEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0185 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0186
         * @tc.name testCombo0186
         * @tc.desc 组合：获焦回调与失焦回调先后注册，焦点成对链路各自返回合法码
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0186 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterBlurEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0186 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0187
         * @tc.name testCombo0187
         * @tc.desc 组合：获焦回调与按键回调先后注册，焦点链路不影响按键链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0187 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0187 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0188
         * @tc.name testCombo0188
         * @tc.desc 组合：获焦回调与带结果按键回调先后注册，返回码合法且形状不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0188 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0188 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0189
         * @tc.name testCombo0189
         * @tc.desc 组合：获焦回调与逐帧回调先后注册，逐帧注册不改写形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0189 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0189 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0190
         * @tc.name testCombo0190
         * @tc.desc 组合：获焦回调与逐帧注销先后执行，注销返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0190 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0190 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0191
         * @tc.name testCombo0191
         * @tc.desc 组合：获焦回调与显示回调先后注册，焦点与显示链路互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0191 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0191 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0192
         * @tc.name testCombo0192
         * @tc.desc 组合：获焦回调与隐藏回调先后注册，焦点与隐藏链路互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0192 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0192 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0193
         * @tc.name testCombo0193
         * @tc.desc 组合：获焦回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0193 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(getShapeIndex())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0193 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0194
         * @tc.name testCombo0194
         * @tc.desc 组合：获焦回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0194 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0194 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0195
         * @tc.name testCombo0195
         * @tc.desc 组合：获焦回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0195 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0195 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0196
         * @tc.name testCombo0196
         * @tc.desc 组合：获焦回调与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0196 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterFocusEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isArkuiErrorCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0196 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0197
         * @tc.name testCombo0197
         * @tc.desc 组合：失焦回调与按键回调先后注册，失焦链路不影响按键链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0197 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0197 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0198
         * @tc.name testCombo0198
         * @tc.desc 组合：失焦回调与带结果按键回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0198 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0198 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0199
         * @tc.name testCombo0199
         * @tc.desc 组合：失焦回调与逐帧回调先后注册，逐帧注册不改写形状索引
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0199 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0199 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0200
         * @tc.name testCombo0200
         * @tc.desc 组合：失焦回调与逐帧注销先后执行，注销返回码合法且形状不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0200 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0200 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0201
         * @tc.name testCombo0201
         * @tc.desc 组合：失焦回调与显示回调先后注册，焦点与显示链路互不干扰
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0201 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0201 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0202
         * @tc.name testCombo0202
         * @tc.desc 组合：失焦回调与隐藏回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0202 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0202 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0203
         * @tc.name testCombo0203
         * @tc.desc 组合：失焦回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0203 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0203 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0204
         * @tc.name testCombo0204
         * @tc.desc 组合：失焦回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0204 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0204 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0205
         * @tc.name testCombo0205
         * @tc.desc 组合：失焦回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0205 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0205 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0206
         * @tc.name testCombo0206
         * @tc.desc 组合：失焦回调与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0206 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterBlurEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(getShapeIndex())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0206 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0207
         * @tc.name testCombo0207
         * @tc.desc 组合：按键回调与带结果按键回调先后注册，两种按键注册形态共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0207 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0207 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0208
         * @tc.name testCombo0208
         * @tc.desc 组合：按键回调与逐帧回调先后注册，按键注册不阻断逐帧链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0208 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0208 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0209
         * @tc.name testCombo0209
         * @tc.desc 组合：按键回调与逐帧注销先后执行，注销返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0209 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0209 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0210
         * @tc.name testCombo0210
         * @tc.desc 组合：按键回调与显示回调先后注册，按键链路不影响显示链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0210 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0210 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0211
         * @tc.name testCombo0211
         * @tc.desc 组合：按键回调与隐藏回调先后注册，按键链路不影响隐藏链路
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0211 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0211 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0212
         * @tc.name testCombo0212
         * @tc.desc 组合：按键回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0212 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0212 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0213
         * @tc.name testCombo0213
         * @tc.desc 组合：按键回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0213 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0213 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0214
         * @tc.name testCombo0214
         * @tc.desc 组合：按键回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0214 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0214 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0215
         * @tc.name testCombo0215
         * @tc.desc 组合：按键回调与按键类输入事件注册先后执行，同域两种注册形态共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0215 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0215 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0216
         * @tc.name testCombo0216
         * @tc.desc 组合：带结果按键回调与逐帧回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0216 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0216 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0217
         * @tc.name testCombo0217
         * @tc.desc 组合：带结果按键回调与逐帧注销先后执行，注销返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0217 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0217 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0218
         * @tc.name testCombo0218
         * @tc.desc 组合：带结果按键回调与显示回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0218 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0218 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0219
         * @tc.name testCombo0219
         * @tc.desc 组合：带结果按键回调与隐藏回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0219 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0219 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0220
         * @tc.name testCombo0220
         * @tc.desc 组合：带结果按键回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0220 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0220 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0221
         * @tc.name testCombo0221
         * @tc.desc 组合：带结果按键回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0221 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isArkuiErrorCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0221 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0222
         * @tc.name testCombo0222
         * @tc.desc 组合：带结果按键回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0222 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0222 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0223
         * @tc.name testCombo0223
         * @tc.desc 组合：带结果按键回调与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0223 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0223 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0224
         * @tc.name testCombo0224
         * @tc.desc 组合：逐帧回调与逐帧注销先后执行，先注册后注销返回码均合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0224 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeUnregisterOnFrameCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0224 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0225
         * @tc.name testCombo0225
         * @tc.desc 组合：逐帧回调与显示回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0225 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0225 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0226
         * @tc.name testCombo0226
         * @tc.desc 组合：逐帧回调与隐藏回调先后注册，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0226 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0226 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0227
         * @tc.name testCombo0227
         * @tc.desc 组合：逐帧回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0227 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0227 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0228
         * @tc.name testCombo0228
         * @tc.desc 组合：逐帧回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0228 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0228 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0229
         * @tc.name testCombo0229
         * @tc.desc 组合：逐帧回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0229 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0229 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0230
         * @tc.name testCombo0230
         * @tc.desc 组合：逐帧回调与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0230 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(getShapeIndex())).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0230 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0231
         * @tc.name testCombo0231
         * @tc.desc 组合：逐帧注销与显示回调先后执行，注销与显示注册返回码均合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0231 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterSurfaceShowCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0231 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0232
         * @tc.name testCombo0232
         * @tc.desc 组合：逐帧注销与隐藏回调先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0232 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0232 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0233
         * @tc.name testCombo0233
         * @tc.desc 组合：逐帧注销与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0233 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            const shapeAfter: number = getShapeIndex();
            expect(isResultCode(first.code)).assertTrue();
            expect(isResultCode(second.code)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0233 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0234
         * @tc.name testCombo0234
         * @tc.desc 组合：逐帧注销与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0234 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0234 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0235
         * @tc.name testCombo0235
         * @tc.desc 组合：逐帧注销与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0235 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0235 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0236
         * @tc.name testCombo0236
         * @tc.desc 组合：逐帧注销与按键类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0236 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeUnregisterOnFrameCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_KEY);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0236 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0237
         * @tc.name testCombo0237
         * @tc.desc 组合：显示回调与隐藏回调先后注册，成对的表面可见性链路共存
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testCombo0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0237 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterSurfaceShowCallback();
            const second: ProbeResult = probeRegisterSurfaceHideCallback();
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeBefore);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0237 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0238
         * @tc.name testCombo0238
         * @tc.desc 组合：显示回调与触摸拦截注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0238 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterSurfaceShowCallback();
            const second: ProbeResult = probeRegisterOnTouchInterceptCallback();
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(Number.isInteger(shapeBefore)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0238 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0239
         * @tc.name testCombo0239
         * @tc.desc 组合：显示回调与触摸类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0239 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterSurfaceShowCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_TOUCH);
            const shapeAfter: number = getShapeIndex();
            expect(bothValid(first, second)).assertTrue();
            expect(shapeAfter).assertEqual(shapeBefore);
            expect(getShapeIndex()).assertEqual(shapeAfter);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0239 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_COMBO_0240
         * @tc.name testCombo0240
         * @tc.desc 组合：显示回调与鼠标类输入事件注册先后执行，两路返回码合法
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level3
         */
        it('testCombo0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0240 begin');
            const shapeBefore: number = getShapeIndex();
            const first: ProbeResult = probeRegisterSurfaceShowCallback();
            const second: ProbeResult = probeRegisterUIInputEventCallback(INPUT_TYPE_MOUSE);
            expect(bothValid(first, second)).assertTrue();
            expect(getShapeIndex()).assertEqual(shapeBefore);
            expect(shapeBefore >= 0).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testCombo0240 end');
        });

    });
}
