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

// notificationRequestUtil 的三种 NotificationRequest 构造。
// 期望值来自 NotificationRequest 字段规格（notificationSlotType / id / content / actionButtons）
// 与源码分支推演（仅 actionButtons.length > 2 时截断），不复制被测实现。
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { WantAgent } from '@kit.AbilityKit';
import { notificationContentUtil, notificationRequestUtil, wantAgentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const WANT_AGENT_ACTION: string = 'ohos.samples.customnotification.test.action';

let sharedWantAgent: WantAgent | undefined = undefined;

function repeatChar(count: number): string {
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
        result += 'B';
    }
    return result;
}

function buildButton(title: string): notification.NotificationActionButton {
    return {
        title: title,
        wantAgent: sharedWantAgent as WantAgent
    };
}

function buildButtons(titles: string[]): notification.NotificationActionButton[] {
    let result: notification.NotificationActionButton[] = [];
    for (let i: number = 0; i < titles.length; i++) {
        result.push(buildButton(titles[i]));
    }
    return result;
}

function readButtons(request: notification.NotificationRequest): notification.NotificationActionButton[] {
    return request.actionButtons as notification.NotificationActionButton[];
}

export default function requestUtilCoreTest() {
    describe('RequestUtilCore', () => {
        let basicContent: notification.NotificationContent = {};

        beforeAll(async () => {
            try {
                sharedWantAgent = await wantAgentUtil.createWantAgentForCommonEvent(WANT_AGENT_ACTION);
                hilog.info(DOMAIN, TAG, '%{public}s', 'shared WantAgent created');
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'createWantAgentForCommonEvent failed');
            }
            basicContent = notificationContentUtil.initBasicNotificationContent({
                title: 'RequestTitle',
                text: 'RequestText',
                additionalText: 'RequestAdditional'
            });
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0001
         * @tc.name testRequest0001
         * @tc.desc 合法值：基础请求固定使用内容信息通道、id 为 1，内容按引用透传
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0001 begin');
            let content: notification.NotificationContent = basicContent;
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
                request.notificationSlotType as number, request.id as number,
                notification.SlotType.CONTENT_INFORMATION, 1);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType).assertEqual(3);
            expect(request.id).assertEqual(1);
            expect(request.content === content).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0002
         * @tc.name testRequest0002
         * @tc.desc 合法值：基础请求不携带 wantAgent 与 actionButtons，两字段保持缺省
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0002 begin');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(basicContent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=undefined,undefined',
                `${request.wantAgent}`, `${request.actionButtons}`);
            expect(request.wantAgent === undefined).assertTrue();
            expect(request.actionButtons === undefined).assertTrue();
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0003
         * @tc.name testRequest0003
         * @tc.desc 边界值：内容对象为空时请求仍被构造，且不补造内容字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0003 begin');
            let emptyContent: notification.NotificationContent = {};
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(emptyContent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${request.content.notificationContentType}`, 'undefined');
            expect(request.content === emptyContent).assertTrue();
            expect(request.content.notificationContentType === undefined).assertTrue();
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0004
         * @tc.name testRequest0004
         * @tc.desc 组合值：长文本内容进入基础请求后内容类型不被改写
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0004 begin');
            let content: notification.NotificationContent = notificationContentUtil.initNotificationLongTextContent({
                title: 'LongTitle',
                text: 'LongText'
            }, 'LongBody', 'LongBrief', 'LongExpanded');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                request.content.notificationContentType as number,
                notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(request.content === content).assertTrue();
            expect(request.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0005
         * @tc.name testRequest0005
         * @tc.desc 状态：连续两次调用返回互不相同的对象，但关键字段取值一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0005 begin');
            let first: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(basicContent);
            let second: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(basicContent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=false',
                `${first === second}`);
            expect(first === second).assertFalse();
            expect(first.notificationSlotType).assertEqual(second.notificationSlotType);
            expect(first.id).assertEqual(second.id);
            expect(first.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0006
         * @tc.name testRequest0006
         * @tc.desc 状态：改写上一次结果的 id 不影响下一次构造，说明无共享状态
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0006 begin');
            let first: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(basicContent);
            first.id = 99;
            let second: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(basicContent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.id as number, 1);
            expect(first.id !== second.id).assertTrue();
            expect(second.id).assertEqual(1);
            expect(second === first).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0007
         * @tc.name testRequest0007
         * @tc.desc 合法值：WantAgent 请求把入参 agent 按引用写入 wantAgent 字段
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0007 begin');
            let agent: WantAgent = sharedWantAgent as WantAgent;
            let request: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(basicContent, agent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${request.wantAgent === agent}`, 'true');
            expect(request.wantAgent === agent).assertTrue();
            expect(request.wantAgent !== undefined).assertTrue();
            expect(request.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0008
         * @tc.name testRequest0008
         * @tc.desc 合法值：WantAgent 请求的通道类型与内容透传规则与基础请求一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0008 begin');
            let content: notification.NotificationContent = basicContent;
            let request: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(content, sharedWantAgent as WantAgent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                request.notificationSlotType as number, notification.SlotType.CONTENT_INFORMATION);
            expect(request.notificationSlotType).assertEqual(notification.SlotType.CONTENT_INFORMATION);
            expect(request.content === content).assertTrue();
            expect(request.actionButtons === undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0009
         * @tc.name testRequest0009
         * @tc.desc 边界值：同一 agent 传入两次，两个请求的 wantAgent 指向同一引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0009 begin');
            let agent: WantAgent = sharedWantAgent as WantAgent;
            let first: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(basicContent, agent);
            let second: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(basicContent, agent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=true',
                `${first.wantAgent === second.wantAgent}`);
            expect(first.wantAgent === second.wantAgent).assertTrue();
            expect(first === second).assertFalse();
            expect(first.id).assertEqual(second.id);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0010
         * @tc.name testRequest0010
         * @tc.desc 组合值：长文本内容与 WantAgent 同时构造时两类信息互不覆盖
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0010 begin');
            let content: notification.NotificationContent = notificationContentUtil.initNotificationLongTextContent({
                title: 'LongTitle',
                text: 'LongText'
            }, 'LongBody', 'LongBrief', 'LongExpanded');
            let request: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(content, sharedWantAgent as WantAgent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d',
                request.content.notificationContentType as number,
                notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT);
            expect(request.wantAgent === sharedWantAgent).assertTrue();
            expect(request.content === content).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0011
         * @tc.name testRequest0011
         * @tc.desc 组合值：同一内容分别走两个入口，内容引用一致而 wantAgent 一有一无
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0011 begin');
            let content: notification.NotificationContent = basicContent;
            let basicRequest: notification.NotificationRequest =
                notificationRequestUtil.initBasicNotificationRequest(content);
            let agentRequest: notification.NotificationRequest =
                notificationRequestUtil.initWantAgentNotificationRequest(content, sharedWantAgent as WantAgent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
                `${basicRequest.content === agentRequest.content}`, 'true');
            expect(basicRequest.content === agentRequest.content).assertTrue();
            expect(basicRequest.wantAgent === undefined).assertTrue();
            expect(agentRequest.wantAgent !== undefined).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0012
         * @tc.name testRequest0012
         * @tc.desc 边界值：零个按钮时 actionButtons 是空数组而不是缺省值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0012 begin');
            let buttons: notification.NotificationActionButton[] = [];
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 0);
            expect(request.actionButtons !== undefined).assertTrue();
            expect(actual.length).assertEqual(0);
            expect(request.id).assertEqual(1);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0013
         * @tc.name testRequest0013
         * @tc.desc 合法值：单个按钮原样进入 actionButtons
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0013 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 1);
            expect(actual.length).assertEqual(1);
            expect(actual[0].title).assertEqual('Button1');
            expect(actual[0] === buttons[0]).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0014
         * @tc.name testRequest0014
         * @tc.desc 边界值：两个按钮不触发截断，顺序保持不变
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0014 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1', 'Button2']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 2);
            expect(actual.length).assertEqual(2);
            expect(actual[0].title).assertEqual('Button1');
            expect(actual[1].title).assertEqual('Button2');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0015
         * @tc.name testRequest0015
         * @tc.desc 边界值：三个按钮刚好越过阈值，结果只保留两个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testRequest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0015 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1', 'Button2', 'Button3']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 2);
            expect(actual.length).assertEqual(2);
            expect(actual.length !== 3).assertTrue();
            expect(actual[0].title).assertEqual('Button1');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0016
         * @tc.name testRequest0016
         * @tc.desc 极值：十个按钮同样只保留两个，结果长度与入参规模无关
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0016 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons([
                'Button1', 'Button2', 'Button3', 'Button4', 'Button5', 'Button6', 'Button7', 'Button8', 'Button9',
                'Button10']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 2);
            expect(actual.length).assertEqual(2);
            expect(actual.length < 10).assertTrue();
            expect(actual[1].title).assertEqual('Button2');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0017
         * @tc.name testRequest0017
         * @tc.desc 边界值：截断保留的是原数组前两个按钮的对象引用
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0017 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1', 'Button2', 'Button3']);
            let firstButton: notification.NotificationActionButton = buttons[0];
            let secondButton: notification.NotificationActionButton = buttons[1];
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', `${actual[0] === firstButton}`, 'true');
            expect(actual[0] === firstButton).assertTrue();
            expect(actual[1] === secondButton).assertTrue();
            expect(actual[0] === actual[1]).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0018
         * @tc.name testRequest0018
         * @tc.desc 状态：超过两个按钮时入参数组保持原样，长度仍为 10（slice 不破坏入参）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0018 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons([
                'Button1', 'Button2', 'Button3', 'Button4', 'Button5', 'Button6', 'Button7', 'Button8', 'Button9',
                'Button10']);
            notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', buttons.length, 10);
            expect(buttons.length).assertEqual(10);
            expect(buttons.length === 10).assertTrue();
            expect(buttons[0].title).assertEqual('Button1');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0019
         * @tc.name testRequest0019
         * @tc.desc 状态：入参数组保持原序，第三个元素仍是原引用（slice 不破坏入参）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0019 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1', 'Button2', 'Button3']);
            let thirdButton: notification.NotificationActionButton = buttons[2];
            notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}s expected=%{public}d,%{public}s',
                buttons.length, buttons[0].title, 3, 'Button1');
            expect(buttons.length).assertEqual(3);
            expect(buttons[0].title).assertEqual('Button1');
            expect(buttons[2] === thirdButton).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0020
         * @tc.name testRequest0020
         * @tc.desc 边界值：恰好两个按钮时入参数组不被修改，仍是原引用与原顺序
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testRequest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0020 begin');
            let buttons: notification.NotificationActionButton[] = buildButtons(['Button1', 'Button2']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', buttons.length, 2);
            expect(buttons.length).assertEqual(2);
            expect(actual === buttons).assertTrue();
            expect(buttons[0].title).assertEqual('Button1');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0021
         * @tc.name testRequest0021
         * @tc.desc 边界值：零个按钮时入参数组同样未被修改
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0021 begin');
            let buttons: notification.NotificationActionButton[] = [];
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', buttons.length, 0);
            expect(buttons.length).assertEqual(0);
            expect(actual === buttons).assertTrue();
            expect(actual.length).assertEqual(0);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0022
         * @tc.name testRequest0022
         * @tc.desc 极值：空串标题与超长标题都不做合规校验，原样写入结果
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0022 begin');
            let longTitle: string = repeatChar(300);
            let buttons: notification.NotificationActionButton[] = buildButtons(['', longTitle]);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d,%{public}d expected=%{public}d,%{public}d',
                actual[0].title.length, actual[1].title.length, 0, 300);
            expect(actual.length).assertEqual(2);
            expect(actual[0].title).assertEqual('');
            expect(actual[1].title).assertEqual(longTitle);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0023
         * @tc.name testRequest0023
         * @tc.desc 组合值：多行内容与六个按钮组合时内容类型保持且按钮被截断为两个
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0023 begin');
            let content: notification.NotificationContent = notificationContentUtil.initNotificationMultiLineContent({
                title: 'LineTitle',
                text: 'LineText'
            }, 'LineBrief', 'LineLongTitle', ['line-0', 'line-1']);
            let buttons: notification.NotificationActionButton[] = buildButtons(
                ['Button1', 'Button2', 'Button3', 'Button4', 'Button5', 'Button6']);
            let request: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(content, buttons);
            let actual: notification.NotificationActionButton[] = readButtons(request);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 2);
            expect(actual.length).assertEqual(2);
            expect(request.content.notificationContentType)
                .assertEqual(notification.ContentType.NOTIFICATION_CONTENT_MULTILINE);
            expect(request.content === content).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_REQUEST_0024
         * @tc.name testRequest0024
         * @tc.desc 状态：两次调用各自削减自己的入参数组，互不影响结果
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testRequest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0024 begin');
            let firstButtons: notification.NotificationActionButton[] = buildButtons(['A1', 'A2', 'A3']);
            let secondButtons: notification.NotificationActionButton[] = buildButtons(['B1', 'B2', 'B3']);
            let first: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, firstButtons);
            let second: notification.NotificationRequest =
                notificationRequestUtil.initButtonNotificationRequest(basicContent, secondButtons);
            let firstActual: notification.NotificationActionButton[] = readButtons(first);
            let secondActual: notification.NotificationActionButton[] = readButtons(second);
            hilog.info(DOMAIN, TAG, 'actual=%{public}s,%{public}s expected=%{public}s,%{public}s',
                firstActual[0].title, secondActual[0].title, 'A1', 'B1');
            expect(firstActual[0].title).assertEqual('A1');
            expect(secondActual[0].title).assertEqual('B1');
            expect(firstActual.length).assertEqual(secondActual.length);
            expect(first === second).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testRequest0024 end');
        });
    });
}
