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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AccountModel } from '../../../main/ets/model/AccountModel';
import { AccountKeyBuilder } from '../../../main/ets/model/AccountKeyBuilder';
import {
    startSampleApp, backToEntrance, expectWideLayout, screenWidthVp, existsId, waitId, tapId, typeId,
    enabledId, topOfId, closeDialog, registerId, modifyId, sleep,
    ID_MUSIC, ID_VIDEO, ID_MAP, ID_NAME, ID_PASSWORD, ID_LOGIN, ID_REGISTER, ID_COMPLETE,
    ID_MODIFY, ID_APPLICATION, ID_DELETE, ID_MOD_COMPLETE, ID_BACK, COMPONENT_WAIT
} from './UiHelper';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const BUNDLE: string = 'Map';
/**
 * 用户名每个用例重新生成。应用侧用的偏好设置目录属于 entry 模块，测试进程拿到的是
 * entry_test 模块的目录，两边互相看不见，只能靠换用户名避免读到上一次的账号。
 */
let WIDE_USER: string = 'wide_user';
const WIDE_PASSWORD: string = 'widePass1';
const WIDE_EMAIL: string = 'wide@example.com';
const WIDE_SIGNATURE: string = 'wide-sign';

function accountNameOf(user: string, bundle: string): string {
    return AccountKeyBuilder.accountName(user, bundle);
}

async function dropAccount(model: AccountModel, name: string): Promise<void> {
    try {
        await model.deleteAccount(name);
    } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'account %{public}s absent, code=%{public}d', name, error.code);
    }
}

/** 清掉本用例用户名下的应用账号，避免同名账号影响下一次注册或登录。 */
async function resetWideState(model: AccountModel): Promise<void> {
    await dropAccount(model, accountNameOf(WIDE_USER, BUNDLE));
}

/** 四个输入框自上而下是否严格递增，用于区分单列与两列。 */
function isStacked(tops: number[]): boolean {
    for (let i = 1; i < tops.length; i++) {
        if (tops[i] <= tops[i - 1]) {
            return false;
        }
    }
    return true;
}

/** 从入口页完成注册与登录，停在账号页。 */
async function reachAccount(driver: Driver): Promise<boolean> {
    await tapId(driver, ID_MUSIC);
    await waitId(driver, ID_NAME, COMPONENT_WAIT);
    await tapId(driver, ID_REGISTER);
    await waitId(driver, registerId(1), COMPONENT_WAIT);
    await typeId(driver, registerId(1), WIDE_USER);
    await typeId(driver, registerId(2), WIDE_EMAIL);
    await typeId(driver, registerId(3), WIDE_SIGNATURE);
    await typeId(driver, registerId(4), WIDE_PASSWORD);
    await typeId(driver, registerId(5), WIDE_PASSWORD);
    await tapId(driver, ID_COMPLETE);
    await closeDialog(driver);
    await waitId(driver, ID_NAME, COMPONENT_WAIT);
    await typeId(driver, ID_NAME, WIDE_USER);
    await typeId(driver, ID_PASSWORD, WIDE_PASSWORD);
    await tapId(driver, ID_LOGIN);
    return await waitId(driver, ID_MODIFY, COMPONENT_WAIT);
}

/** 在账号页继续进入修改页。 */
async function reachModify(driver: Driver): Promise<boolean> {
    await reachAccount(driver);
    await tapId(driver, ID_MODIFY);
    return await waitId(driver, modifyId(1), COMPONENT_WAIT);
}

export default function accountUiWideTest() {
    describe('AccountUiWideTest', () => {
        let driver: Driver = Driver.create();
        let model: AccountModel = new AccountModel();

        beforeAll(async () => {
            await startSampleApp();
        });

        beforeEach(async () => {
            WIDE_USER = 'wu' + String(Date.now() % 1000000);
            await startSampleApp();
            await backToEntrance(driver);
            await resetWideState(model);
        });

        afterEach(async () => {
            await backToEntrance(driver);
            await resetWideState(model);
        });

        /**
         * @tc.name   testAccountUiWide0001
         * @tc.number SUB_ACCT_UIWIDE_1001
         * @tc.desc   入口页双栏时同屏渲染登录面板，四个交互控件全部可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUiWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0001 begin');
            const wide: boolean = expectWideLayout();
            const hasName: boolean = await existsId(driver, ID_NAME);
            const hasPassword: boolean = await existsId(driver, ID_PASSWORD);
            const hasLogin: boolean = await existsId(driver, ID_LOGIN);
            const hasRegister: boolean = await existsId(driver, ID_REGISTER);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}d wide=%{public}s name=%{public}s password=%{public}s',
                screenWidthVp(), String(wide), String(hasName), String(hasPassword));
            expect(hasName).assertEqual(wide);
            expect(hasPassword).assertEqual(wide);
            expect(hasLogin).assertEqual(wide);
            expect(hasRegister).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0001 end');
        });

        /**
         * @tc.name   testAccountUiWide0002
         * @tc.number SUB_ACCT_UIWIDE_1002
         * @tc.desc   入口页单栏时只渲染应用卡片，登录面板整体不可见
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level0
         */
        it('testAccountUiWide0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0002 begin');
            const wide: boolean = expectWideLayout();
            const hasMusic: boolean = await existsId(driver, ID_MUSIC);
            const hasVideo: boolean = await existsId(driver, ID_VIDEO);
            const hasMap: boolean = await existsId(driver, ID_MAP);
            const hasPassword: boolean = await existsId(driver, ID_PASSWORD);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s cards=%{public}s%{public}s%{public}s password=%{public}s',
                String(wide), String(hasMusic), String(hasVideo), String(hasMap), String(hasPassword));
            expect(hasMusic).assertTrue();
            expect(hasVideo).assertTrue();
            expect(hasMap).assertTrue();
            expect(hasPassword).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0002 end');
        });

        /**
         * @tc.name   testAccountUiWide0003
         * @tc.number SUB_ACCT_UIWIDE_1003
         * @tc.desc   登录页双栏时左侧保留三张应用卡片，单栏时不渲染侧栏
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0003 begin');
            const wide: boolean = expectWideLayout();
            await tapId(driver, ID_MUSIC);
            const onLogin: boolean = await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const sidebarMusic: boolean = await existsId(driver, ID_MUSIC);
            const sidebarVideo: boolean = await existsId(driver, ID_VIDEO);
            const sidebarMap: boolean = await existsId(driver, ID_MAP);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'login=%{public}s sidebar=%{public}s%{public}s%{public}s wide=%{public}s',
                String(onLogin), String(sidebarMusic), String(sidebarVideo), String(sidebarMap), String(wide));
            expect(onLogin).assertTrue();
            expect(sidebarMusic).assertEqual(wide);
            expect(sidebarVideo).assertEqual(wide);
            expect(sidebarMap).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0003 end');
        });

        /**
         * @tc.name   testAccountUiWide0004
         * @tc.number SUB_ACCT_UIWIDE_1004
         * @tc.desc   注册页双栏时侧栏与五个输入框同屏，单栏时只有表单
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0004 begin');
            const wide: boolean = expectWideLayout();
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            const onRegister: boolean = await waitId(driver, registerId(1), COMPONENT_WAIT);
            const complete: boolean = await existsId(driver, ID_COMPLETE);
            const sidebar: boolean = await existsId(driver, ID_VIDEO);
            hilog.info(LOG_DOMAIN, LOG_TAG,
                'register=%{public}s complete=%{public}s sidebar=%{public}s wide=%{public}s',
                String(onRegister), String(complete), String(sidebar), String(wide));
            expect(onRegister).assertTrue();
            expect(complete).assertTrue();
            expect(sidebar).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0004 end');
        });

        /**
         * @tc.name   testAccountUiWide0005
         * @tc.number SUB_ACCT_UIWIDE_1005
         * @tc.desc   账号页双栏时侧栏与三个按钮同屏，单栏时只有按钮
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0005 begin');
            const wide: boolean = expectWideLayout();
            const onAccount: boolean = await reachAccount(driver);
            const hasDelete: boolean = await existsId(driver, ID_DELETE);
            const sidebar: boolean = await existsId(driver, ID_VIDEO);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'account=%{public}s delete=%{public}s sidebar=%{public}s wide=%{public}s',
                String(onAccount), String(hasDelete), String(sidebar), String(wide));
            expect(onAccount).assertTrue();
            expect(hasDelete).assertTrue();
            expect(sidebar).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0005 end');
        });

        /**
         * @tc.name   testAccountUiWide0006
         * @tc.number SUB_ACCT_UIWIDE_1006
         * @tc.desc   修改页双栏时侧栏与四个输入框同屏，单栏时只有输入框
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0006 begin');
            const wide: boolean = expectWideLayout();
            const onModify: boolean = await reachModify(driver);
            const hasFourth: boolean = await existsId(driver, modifyId(4));
            const sidebar: boolean = await existsId(driver, ID_VIDEO);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'modify=%{public}s fourth=%{public}s sidebar=%{public}s wide=%{public}s',
                String(onModify), String(hasFourth), String(sidebar), String(wide));
            expect(onModify).assertTrue();
            expect(hasFourth).assertTrue();
            expect(sidebar).assertEqual(wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0006 end');
        });

        /**
         * @tc.name   testAccountUiWide0007
         * @tc.number SUB_ACCT_UIWIDE_1007
         * @tc.desc   登录页与注册页都提供返回入口，与布局宽窄无关
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0007 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const loginBar: boolean = await existsId(driver, ID_BACK);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            const registerBar: boolean = await existsId(driver, ID_BACK);
            const registerForm: boolean = await existsId(driver, ID_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'loginBar=%{public}s registerBar=%{public}s form=%{public}s',
                String(loginBar), String(registerBar), String(registerForm));
            expect(loginBar).assertTrue();
            expect(registerBar).assertTrue();
            expect(registerForm).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0007 end');
        });

        /**
         * @tc.name   testAccountUiWide0008
         * @tc.number SUB_ACCT_UIWIDE_1008
         * @tc.desc   入口页只作为根页面提交跳转，导航栏不带返回入口
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0008 begin');
            const hasBack: boolean = await existsId(driver, ID_BACK);
            const hasMusic: boolean = await existsId(driver, ID_MUSIC);
            const hasName: boolean = await existsId(driver, ID_NAME);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'back=%{public}s music=%{public}s name=%{public}s',
                String(hasBack), String(hasMusic), String(hasName));
            expect(hasBack).assertFalse();
            expect(hasMusic).assertTrue();
            expect(hasName).assertEqual(expectWideLayout());
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0008 end');
        });

        /**
         * @tc.name   testAccountUiWide0009
         * @tc.number SUB_ACCT_UIWIDE_1009
         * @tc.desc   双栏侧栏点击应用卡片只切换选中项，不离开当前登录页
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0009 begin');
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            const sidebar: boolean = await existsId(driver, ID_VIDEO);
            if (sidebar) {
                await tapId(driver, ID_VIDEO);
            }
            await sleep(400);
            const stillLogin: boolean = await existsId(driver, ID_NAME);
            const noRegisterForm: boolean = await existsId(driver, ID_COMPLETE);
            const sideCardGone: boolean = await existsId(driver, ID_VIDEO);
            hilog.info(LOG_DOMAIN, LOG_TAG,
                'sidebar=%{public}s login=%{public}s registerForm=%{public}s video=%{public}s',
                String(sidebar), String(stillLogin), String(noRegisterForm), String(sideCardGone));
            expect(sidebar).assertEqual(expectWideLayout());
            expect(stillLogin).assertTrue();
            expect(noRegisterForm).assertFalse();
            expect(sideCardGone).assertEqual(expectWideLayout());
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0009 end');
        });

        /**
         * @tc.name   testAccountUiWide0010
         * @tc.number SUB_ACCT_UIWIDE_1010
         * @tc.desc   账号页双栏切换侧栏应用后账号信息清空，修改与删除按钮变灰
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level1
         */
        it('testAccountUiWide0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0010 begin');
            const wide: boolean = expectWideLayout();
            await reachAccount(driver);
            const modifyBefore: boolean = await enabledId(driver, ID_MODIFY);
            const sidebar: boolean = await existsId(driver, ID_VIDEO);
            if (sidebar) {
                await tapId(driver, ID_VIDEO);
            }
            await sleep(400);
            const modifyAfter: boolean = await enabledId(driver, ID_MODIFY);
            const deleteAfter: boolean = await enabledId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s sidebar=%{public}s before=%{public}s after=%{public}s',
                String(wide), String(sidebar), String(modifyBefore), String(modifyAfter));
            expect(modifyBefore).assertTrue();
            expect(sidebar).assertEqual(wide);
            expect(modifyAfter).assertEqual(!wide);
            expect(deleteAfter).assertEqual(!wide);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0010 end');
        });

        /**
         * @tc.name   testAccountUiWide0011
         * @tc.number SUB_ACCT_UIWIDE_1011
         * @tc.desc   修改页双栏时前两个字段同行排布，单栏时上下堆叠
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAccountUiWide0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0011 begin');
            const wide: boolean = expectWideLayout();
            await reachModify(driver);
            const firstTop: number = await topOfId(driver, modifyId(1));
            const secondTop: number = await topOfId(driver, modifyId(2));
            const thirdTop: number = await topOfId(driver, modifyId(3));
            const fourthTop: number = await topOfId(driver, modifyId(4));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s tops=%{public}d/%{public}d/%{public}d/%{public}d',
                String(wide), firstTop, secondTop, thirdTop, fourthTop);
            expect(firstTop === secondTop).assertEqual(wide);
            expect(thirdTop === fourthTop).assertEqual(wide);
            expect(firstTop < thirdTop).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0011 end');
        });

        /**
         * @tc.name   testAccountUiWide0012
         * @tc.number SUB_ACCT_UIWIDE_1012
         * @tc.desc   注册页双栏时前两个输入框同行排布，单栏时上下堆叠
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAccountUiWide0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0012 begin');
            const wide: boolean = expectWideLayout();
            await tapId(driver, ID_MUSIC);
            await waitId(driver, ID_NAME, COMPONENT_WAIT);
            await tapId(driver, ID_REGISTER);
            await waitId(driver, registerId(1), COMPONENT_WAIT);
            const firstTop: number = await topOfId(driver, registerId(1));
            const secondTop: number = await topOfId(driver, registerId(2));
            const thirdTop: number = await topOfId(driver, registerId(3));
            const completeTop: number = await topOfId(driver, ID_COMPLETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s tops=%{public}d/%{public}d/%{public}d/%{public}d',
                String(wide), firstTop, secondTop, thirdTop, completeTop);
            expect(firstTop === secondTop).assertEqual(wide);
            expect(thirdTop > secondTop).assertTrue();
            expect(completeTop > thirdTop).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0012 end');
        });

        /**
         * @tc.name   testAccountUiWide0013
         * @tc.number SUB_ACCT_UIWIDE_1013
         * @tc.desc   账号页双栏时修改、切换应用、删除三个按钮同行，单栏时逐行排列
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAccountUiWide0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0013 begin');
            const wide: boolean = expectWideLayout();
            await reachAccount(driver);
            const modifyTop: number = await topOfId(driver, ID_MODIFY);
            const applicationTop: number = await topOfId(driver, ID_APPLICATION);
            const deleteTop: number = await topOfId(driver, ID_DELETE);
            const deleteEnabled: boolean = await enabledId(driver, ID_DELETE);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s tops=%{public}d/%{public}d/%{public}d enabled=%{public}s',
                String(wide), modifyTop, applicationTop, deleteTop, String(deleteEnabled));
            expect(modifyTop === applicationTop).assertEqual(wide);
            expect(applicationTop === deleteTop).assertEqual(wide);
            expect(deleteEnabled).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0013 end');
        });

        /**
         * @tc.name   testAccountUiWide0014
         * @tc.number SUB_ACCT_UIWIDE_1014
         * @tc.desc   修改页单栏时四个字段自上而下严格递增，双栏时前两行并列
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  Level2
         */
        it('testAccountUiWide0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0014 begin');
            const wide: boolean = expectWideLayout();
            await reachModify(driver);
            const tops: number[] = [];
            tops.push(await topOfId(driver, modifyId(1)));
            tops.push(await topOfId(driver, modifyId(2)));
            tops.push(await topOfId(driver, modifyId(3)));
            tops.push(await topOfId(driver, modifyId(4)));
            const stacked: boolean = isStacked(tops);
            hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s stacked=%{public}s', String(wide), String(stacked));
            hilog.info(LOG_DOMAIN, LOG_TAG, 'tops=%{public}d/%{public}d/%{public}d/%{public}d',
                tops[0], tops[1], tops[2], tops[3]);
            expect(stacked).assertEqual(!wide);
            expect(tops[0] < tops[2]).assertTrue();
            expect(tops[3] >= tops[2]).assertTrue();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccountUiWide0014 end');
        });
    });
}
