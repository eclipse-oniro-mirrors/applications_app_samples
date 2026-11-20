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

import { describe, it, beforeAll, beforeEach, afterAll, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Rect, Point } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

const BUNDLE_NAME: string = 'com.samples.xcomponent3d';
const ABILITY_NAME: string = 'EntryAbility';
const COMPONENT_TIMEOUT_MS: number = 3000;
const LAUNCH_DELAY_MS: number = 5000;

const CUBE_ID: string = 'DrawCube';
const TRANSFORM_ID: string = 'DrawTransform';

let uiDriver: Driver = Driver.create();

async function locate(id: string): Promise<Component> {
    return await uiDriver.waitForComponent(ON.id(id), COMPONENT_TIMEOUT_MS);
}

function isPositive(value: number): boolean {
    return value > 0;
}

export default function nativeUiCoreTest() {
    resetYieldCounter();
    describe('NativeUiCoreTest', () => {

        beforeEach(async () => {
            await yieldToSystem();
        });

        beforeAll(async (startAbility: Function) => {
            const delegator: abilityDelegatorRegistry.AbilityDelegator =
                abilityDelegatorRegistry.getAbilityDelegator();
            const want: Want = {
                bundleName: BUNDLE_NAME,
                abilityName: ABILITY_NAME
            };
            delegator.startAbility(want, (err) => {
                hilog.info(DOMAIN, TAG, '%{public}s', `startAbility finished ${JSON.stringify(err)}`);
            });
            await uiDriver.delayMs(LAUNCH_DELAY_MS);
            startAbility();
        });

        afterAll(async (lockAbilityTerminateSelf: Function) => {
            const delegator: abilityDelegatorRegistry.AbilityDelegator =
                abilityDelegatorRegistry.getAbilityDelegator();
            delegator.executeShellCommand(`aa force-stop ${BUNDLE_NAME}`, (err, data) => {
                hilog.info(DOMAIN, TAG, '%{public}s', `force-stop finished ${JSON.stringify(err)}`);
            });
            lockAbilityTerminateSelf();
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0001
         * @tc.name testUi0001
         * @tc.desc 界面：立方档按钮可定位、文案逐字匹配且组件真实存在
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0001 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                expect(cube !== undefined).assertTrue();
                expect(await cube.getText()).assertEqual(CUBE_ID);
                await uiDriver.assertComponentExist(ON.id(CUBE_ID));
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0001 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0001 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0002
         * @tc.name testUi0002
         * @tc.desc 界面：旋转档按钮可定位、文案逐字匹配且标识回读一致
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0002 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                expect(await transform.getText()).assertEqual(TRANSFORM_ID);
                expect(await transform.getId()).assertEqual(TRANSFORM_ID);
                expect(transform !== undefined).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0002 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0002 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0003
         * @tc.name testUi0003
         * @tc.desc 界面：立方档按钮标识回读为自身且与文案相同
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level1
         */
        it('testUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0003 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const id: string = await cube.getId();
                const text: string = await cube.getText();
                expect(id).assertEqual(CUBE_ID);
                expect(id).assertEqual(text);
                expect(id.length).assertEqual(CUBE_ID.length);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0003 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0003 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0004
         * @tc.name testUi0004
         * @tc.desc 界面：旋转档按钮标识两次读取相同且可点击
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0004 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const first: string = await transform.getId();
                const second: string = await transform.getId();
                expect(second).assertEqual(first);
                expect(await transform.isClickable()).assertTrue();
                expect(first).assertEqual(TRANSFORM_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0004 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0004 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0005
         * @tc.name testUi0005
         * @tc.desc 界面：立方档按钮类型名包含文本语义且文案非空
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0005 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const typeName: string = await cube.getType();
                expect(typeName.length > 0).assertTrue();
                expect(typeName.indexOf('Text') >= 0).assertTrue();
                expect((await cube.getText()).length > 0).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0005 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0005 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0006
         * @tc.name testUi0006
         * @tc.desc 界面：旋转档按钮类型名两次一致且组件处于可用状态
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0006 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const first: string = await transform.getType();
                const second: string = await transform.getType();
                expect(second).assertEqual(first);
                expect(await transform.isEnabled()).assertTrue();
                expect(first.length > 0).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0006 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0006 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0007
         * @tc.name testUi0007
         * @tc.desc 界面：立方档按钮可点击且标识回读仍为自身
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0007 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                expect(await cube.isClickable()).assertTrue();
                const id: string = await cube.getId();
                expect(id).assertEqual(CUBE_ID);
                expect(id.indexOf(TRANSFORM_ID) < 0).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0007 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0007 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0008
         * @tc.name testUi0008
         * @tc.desc 界面：旋转档按钮可点击且文案不被相邻按钮污染
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0008 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                expect(await transform.isClickable()).assertTrue();
                const text: string = await transform.getText();
                expect(text).assertEqual(TRANSFORM_ID);
                expect(text.indexOf(CUBE_ID) < 0).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0008 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0008 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0009
         * @tc.name testUi0009
         * @tc.desc 界面：立方档按钮可用且不可滚动，两项状态确定
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0009 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                expect(await cube.isEnabled()).assertTrue();
                expect(await cube.isScrollable()).assertFalse();
                expect(await cube.getText()).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0009 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0009 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0010
         * @tc.name testUi0010
         * @tc.desc 界面：旋转档按钮可用且类型名与立方档按钮一致
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0010 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const cube: Component = await locate(CUBE_ID);
                expect(await transform.isEnabled()).assertTrue();
                expect(await transform.getType()).assertEqual(await cube.getType());
                expect(await transform.getText()).assertEqual(TRANSFORM_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0010 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0010 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0011
         * @tc.name testUi0011
         * @tc.desc 界面：立方档按钮不可滚动且标识非空
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0011 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                expect(await cube.isScrollable()).assertFalse();
                const id: string = await cube.getId();
                expect(id.length > 0).assertTrue();
                expect(id).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0011 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0011 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0012
         * @tc.name testUi0012
         * @tc.desc 界面：旋转档按钮不可滚动且文案长度与标识长度相同
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0012 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const text: string = await transform.getText();
                expect(await transform.isScrollable()).assertFalse();
                expect(text.length).assertEqual(TRANSFORM_ID.length);
                expect(text).assertEqual(TRANSFORM_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0012 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0012 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0013
         * @tc.name testUi0013
         * @tc.desc 界面：立方档按钮焦点状态两次读取一致且文案不变
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0013 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const first: boolean = await cube.isFocused();
                const second: boolean = await cube.isFocused();
                expect(second).assertEqual(first);
                expect(await cube.getText()).assertEqual(CUBE_ID);
                expect(await cube.isClickable()).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0013 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0013 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0014
         * @tc.name testUi0014
         * @tc.desc 界面：旋转档按钮焦点状态两次读取一致且标识正确
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0014 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const first: boolean = await transform.isFocused();
                const second: boolean = await transform.isFocused();
                expect(first).assertEqual(second);
                expect(await transform.getId()).assertEqual(TRANSFORM_ID);
                expect(await transform.isScrollable()).assertFalse();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0014 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0014 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0015
         * @tc.name testUi0015
         * @tc.desc 界面：立方档按钮选中态两次读取一致且文案仍匹配
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0015 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const first: boolean = await cube.isChecked();
                const second: boolean = await cube.isChecked();
                expect(second).assertEqual(first);
                expect(await cube.getText()).assertEqual(CUBE_ID);
                expect(await cube.isEnabled()).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0015 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0015 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0016
         * @tc.name testUi0016
         * @tc.desc 界面：旋转档按钮选中态两次读取一致且类型名非空
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0016 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const first: boolean = await transform.isChecked();
                const second: boolean = await transform.isChecked();
                expect(first).assertEqual(second);
                expect((await transform.getType()).length > 0).assertTrue();
                expect(await transform.isScrollable()).assertFalse();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0016 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0016 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0017
         * @tc.name testUi0017
         * @tc.desc 界面：立方档按钮边界盒宽高均为正且标识回读正确
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0017 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const bounds: Rect = await cube.getBounds();
                expect(isPositive(bounds.right - bounds.left)).assertTrue();
                expect(isPositive(bounds.bottom - bounds.top)).assertTrue();
                expect(await cube.getId()).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0017 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0017 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0018
         * @tc.name testUi0018
         * @tc.desc 界面：旋转档按钮边界盒完全位于屏幕内且文案保持
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0018 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                const bounds: Rect = await transform.getBounds();
                expect(bounds.left >= 0).assertTrue();
                expect(bounds.top >= 0).assertTrue();
                expect(bounds.right > bounds.left).assertTrue();
                expect(await transform.getText()).assertEqual(TRANSFORM_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0018 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0018 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0019
         * @tc.name testUi0019
         * @tc.desc 界面：立方档按钮中心点在屏内且横坐标非负
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0019 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                const center: Point = await cube.getBoundsCenter();
                expect(center.x >= 0).assertTrue();
                expect(center.y > 0).assertTrue();
                expect(await cube.getId()).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0019 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0019 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0020
         * @tc.name testUi0020
         * @tc.desc 界面：旋转档按钮中心点横坐标大于立方档按钮，两档同排排列
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0020 begin');
            try {
                const cubeCenter: Point = await (await locate(CUBE_ID)).getBoundsCenter();
                const transformCenter: Point = await (await locate(TRANSFORM_ID)).getBoundsCenter();
                expect(transformCenter.x > cubeCenter.x).assertTrue();
                expect(transformCenter.y > 0).assertTrue();
                expect(await (await locate(TRANSFORM_ID)).getText()).assertEqual(TRANSFORM_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0020 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0020 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0021
         * @tc.name testUi0021
         * @tc.desc 界面：两档按钮同时存在且各自标识互不相同
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0021 begin');
            try {
                await uiDriver.assertComponentExist(ON.id(CUBE_ID));
                await uiDriver.assertComponentExist(ON.id(TRANSFORM_ID));
                const cubeId: string = await (await locate(CUBE_ID)).getId();
                const transformId: string = await (await locate(TRANSFORM_ID)).getId();
                expect(cubeId === transformId).assertFalse();
                expect(cubeId).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0021 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0021 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0022
         * @tc.name testUi0022
         * @tc.desc 界面：点击旋转档后按钮仍存在且文案不变
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0022 begin');
            try {
                const transform: Component = await locate(TRANSFORM_ID);
                await transform.click();
                await uiDriver.assertComponentExist(ON.id(TRANSFORM_ID));
                expect(await transform.getText()).assertEqual(TRANSFORM_ID);
                expect(await transform.isScrollable()).assertFalse();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0022 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0022 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0023
         * @tc.name testUi0023
         * @tc.desc 界面：点击立方档后按钮仍存在且标识不变
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level2
         */
        it('testUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0023 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                await cube.click();
                await uiDriver.assertComponentExist(ON.id(CUBE_ID));
                expect(await cube.getId()).assertEqual(CUBE_ID);
                expect(await cube.isClickable()).assertTrue();
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0023 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0023 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0024
         * @tc.name testUi0024
         * @tc.desc 界面：两档按钮交替点击三轮后两元素仍可定位且文案不变
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0024 begin');
            try {
                let rounds: number = 0;
                for (let i = 0; i < 3; i++) {
                    await (await locate(TRANSFORM_ID)).click();
                    await (await locate(CUBE_ID)).click();
                    rounds++;
                }
                expect(rounds).assertEqual(3);
                await uiDriver.assertComponentExist(ON.id(CUBE_ID));
                await uiDriver.assertComponentExist(ON.id(TRANSFORM_ID));
                expect(await (await locate(CUBE_ID)).getText()).assertEqual(CUBE_ID);
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0024 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0024 end');
        });

        /**
         * @tc.number SUB_XCOMPONENT3D_UI_0025
         * @tc.name testUi0025
         * @tc.desc 界面：收尾复位到立方档，两档按钮与绘制区同时存在
         * @tc.type Function
         * @tc.size MediumTest
         * @tc.level Level3
         */
        it('testUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0025 begin');
            try {
                const cube: Component = await locate(CUBE_ID);
                await cube.click();
                expect(await cube.getText()).assertEqual(CUBE_ID);
                expect(await cube.isScrollable()).assertFalse();
                await uiDriver.assertComponentExist(ON.id(CUBE_ID));
                await uiDriver.assertComponentExist(ON.id(TRANSFORM_ID));
                await uiDriver.assertComponentExist(ON.type('XComponent'));
            } catch (err) {
                hilog.error(DOMAIN, TAG, '%{public}s', `testUi0025 failed ${JSON.stringify(err)}`);
                expect().assertFail();
            }
            done();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testUi0025 end');
        });
    });
}
