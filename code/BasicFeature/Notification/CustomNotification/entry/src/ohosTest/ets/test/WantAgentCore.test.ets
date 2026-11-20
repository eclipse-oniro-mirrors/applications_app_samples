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

// wantAgentUtil 的两种 WantAgent 构造。
// 期望值来源：WantAgentInfo 规格常量（operationType 为 START_ABILITY / SEND_COMMON_EVENT、
// requestCode 固定为 0）+ 系统回读 API（getOperationType / equal）作为被测输出的观测手段。
// 断言不接受"仅非空"：每个用例都回读 operationType 或与另一个 agent 做等值比较。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { wantAgent, WantAgent } from '@kit.AbilityKit';
import { notificationManager as notification } from '@kit.NotificationKit';
import { wantAgentUtil } from '@ohos/notification';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const BUNDLE_NAME: string = 'ohos.samples.customnotification';
const ABILITY_NAME: string = 'MainAbility';
const COMMON_EVENT_ACTION: string = 'com.example.customnotification.BUTTON_CLICK';

async function readOperationType(agent: WantAgent): Promise<number> {
    return await wantAgent.getOperationType(agent);
}

function buildButton(title: string, agent: WantAgent): notification.NotificationActionButton {
    return { title: title, wantAgent: agent };
}

export default function wantAgentCoreTest() {
    describe('WantAgentCore', () => {
        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0001
         * @tc.name testWantAgent0001
         * @tc.desc 启动应用型 WantAgent：operationType 为 START_ABILITY，且与自身等值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testWantAgent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0001 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let operationType: number = await readOperationType(agent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d',
                operationType, wantAgent.OperationType.START_ABILITY);
            expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            expect(operationType === wantAgent.OperationType.SEND_COMMON_EVENT).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0001 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0002
         * @tc.name testWantAgent0002
         * @tc.desc 同 bundle/ability 两次创建：两个 agent 等值，operationType 同为 START_ABILITY
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testWantAgent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0002 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let second: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let isEqual: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=true', String(isEqual));
            expect(isEqual).assertTrue();
            expect(await readOperationType(first)).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(await readOperationType(second)).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0002 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0003
         * @tc.name testWantAgent0003
         * @tc.desc 仅 abilityName 不同：两个 agent 不等值，operationType 仍为 START_ABILITY
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0003 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let second: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'EntryAbility');
            let isEqual: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=false', String(isEqual));
            expect(isEqual).assertFalse();
            expect(await readOperationType(first)).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(await readOperationType(second)).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0003 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0004
         * @tc.name testWantAgent0004
         * @tc.desc 仅 bundleName 不同：两个 agent 不等值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0004 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let second: WantAgent =
                await wantAgentUtil.createWantAgentForStartAbility('ohos.samples.otherbundle', ABILITY_NAME);
            let isEqual: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=false', String(isEqual));
            expect(isEqual).assertFalse();
            expect(await readOperationType(first)).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(await readOperationType(second)).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0004 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0005
         * @tc.name testWantAgent0005
         * @tc.desc abilityName 含下划线与数字：仍按启动应用方式构造，可直接作为按钮 wantAgent
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0005 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'Main_Ability2');
            let button: notification.NotificationActionButton = buildButton('Button_1', agent);
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d title=%{public}s, expected=%{public}d/Button_1',
                await readOperationType(agent), button.title, wantAgent.OperationType.START_ABILITY);
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(button.title).assertEqual('Button_1');
            expect(button.wantAgent === agent).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0005 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0006
         * @tc.name testWantAgent0006
         * @tc.desc 超长 bundleName（120 字符）：构造结果 operationType 仍为 START_ABILITY
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0006 begin');
            let longBundle: string = BUNDLE_NAME + '_' + 'b'.repeat(120);
            let agent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(longBundle, ABILITY_NAME);
            let operationType: number = await readOperationType(agent);
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                operationType, wantAgent.OperationType.START_ABILITY);
            expect(operationType).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            expect(await wantAgent.equal(agent,
                await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME))).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0006 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0007
         * @tc.name testWantAgent0007
         * @tc.desc 启动应用型 agent 的 getBundleName 返回非空字符串
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0007 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let bundleName: string = await wantAgent.getBundleName(agent);
            hilog.info(DOMAIN, TAG, 'bundleName=%{public}s, expected=non-empty', bundleName);
            expect(bundleName.length > 0).assertTrue();
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(bundleName === '').assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0007 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0008
         * @tc.name testWantAgent0008
         * @tc.desc 连续创建 3 个不同 ability 的启动型 agent：两两不等值，operationType 全为 START_ABILITY
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0008 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'AbilityA');
            let second: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'AbilityB');
            let third: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'AbilityC');
            hilog.info(DOMAIN, TAG, 'a=b %{public}s b=c %{public}s, expected=false/false',
                String(await wantAgent.equal(first, second)), String(await wantAgent.equal(second, third)));
            expect(await wantAgent.equal(first, second)).assertFalse();
            expect(await wantAgent.equal(second, third)).assertFalse();
            expect(await wantAgent.equal(first, third)).assertFalse();
            expect(await readOperationType(third)).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0008 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0009
         * @tc.name testWantAgent0009
         * @tc.desc 启动型 agent 可直接作为 NotificationActionButton 的 wantAgent，title 原样保留
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0009 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let button: notification.NotificationActionButton = buildButton('Open', agent);
            hilog.info(DOMAIN, TAG, 'title=%{public}s, expected=Open', button.title);
            expect(button.title).assertEqual('Open');
            expect(button.wantAgent === agent).assertTrue();
            expect(await readOperationType(button.wantAgent)).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0009 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0010
         * @tc.name testWantAgent0010
         * @tc.desc 公共事件型 WantAgent：operationType 为 SEND_COMMON_EVENT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testWantAgent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0010 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let operationType: number = await readOperationType(agent);
            hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d',
                operationType, wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(operationType).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            expect(operationType === wantAgent.OperationType.START_ABILITY).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0010 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0011
         * @tc.name testWantAgent0011
         * @tc.desc 同 action 两次创建：两个 agent 等值，operationType 同为 SEND_COMMON_EVENT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testWantAgent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0011 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let second: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let isEqual: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=true', String(isEqual));
            expect(isEqual).assertTrue();
            expect(await readOperationType(first)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(second)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0011 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0012
         * @tc.name testWantAgent0012
         * @tc.desc 不同 action：两个公共事件 agent 不等值，operationType 一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0012 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent('action.one');
            let second: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent('action.two');
            let isEqual: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=false', String(isEqual));
            expect(isEqual).assertFalse();
            expect(await readOperationType(first)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(second)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0012 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0013
         * @tc.name testWantAgent0013
         * @tc.desc 超长 action（200 字符）：operationType 仍为 SEND_COMMON_EVENT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0013 begin');
            let longAction: string = 'a'.repeat(200);
            let agent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(longAction);
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                await readOperationType(agent), wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            expect(await wantAgent.equal(agent,
                await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION))).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0013 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0014
         * @tc.name testWantAgent0014
         * @tc.desc 带包名前缀的 action（点号分隔）：operationType 仍为 SEND_COMMON_EVENT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0014 begin');
            let agent: WantAgent =
                await wantAgentUtil.createWantAgentForCommonEvent('ohos.samples.customnotification.ACTION');
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                await readOperationType(agent), wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            expect(await wantAgent.equal(agent,
                await wantAgentUtil.createWantAgentForCommonEvent('ohos.samples.customnotification.OTHER')))
                .assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0014 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0015
         * @tc.name testWantAgent0015
         * @tc.desc action 大小写不同视为不同 agent（等值比较为 false）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0015 begin');
            let upper: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent('ACTION_NOTIFY');
            let lower: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent('action_notify');
            let isEqual: boolean = await wantAgent.equal(upper, lower);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=false', String(isEqual));
            expect(isEqual).assertFalse();
            expect(await readOperationType(upper)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(lower)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0015 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0016
         * @tc.name testWantAgent0016
         * @tc.desc 单字符 action：边界输入仍构造为 SEND_COMMON_EVENT
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0016 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent('a');
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                await readOperationType(agent), wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(await wantAgent.equal(agent,
                await wantAgentUtil.createWantAgentForCommonEvent('b'))).assertFalse();
            expect(await wantAgent.equal(agent, agent)).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0016 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0017
         * @tc.name testWantAgent0017
         * @tc.desc 连续创建 5 个不同 action：全部为 SEND_COMMON_EVENT 且两两不等值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0017 begin');
            let agents: WantAgent[] = [];
            for (let i: number = 0; i < 5; i++) {
                agents.push(await wantAgentUtil.createWantAgentForCommonEvent('action.' + i));
            }
            let allCommonEvent: boolean = true;
            for (let i: number = 0; i < agents.length; i++) {
                let type: number = await readOperationType(agents[i]);
                if (type !== wantAgent.OperationType.SEND_COMMON_EVENT) {
                    allCommonEvent = false;
                }
            }
            hilog.info(DOMAIN, TAG, 'count=%{public}d allCommonEvent=%{public}s, expected=5/true',
                agents.length, String(allCommonEvent));
            expect(agents.length).assertEqual(5);
            expect(allCommonEvent).assertTrue();
            expect(await wantAgent.equal(agents[0], agents[4])).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0017 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0018
         * @tc.name testWantAgent0018
         * @tc.desc 公共事件 agent 与启动应用 agent 不等值，但都能作为按钮 wantAgent
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0018 begin');
            let commonAgent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let startAgent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let commonButton: notification.NotificationActionButton = buildButton('First', commonAgent);
            let startButton: notification.NotificationActionButton = buildButton('Second', startAgent);
            hilog.info(DOMAIN, TAG, 'equal=%{public}s, expected=false',
                String(await wantAgent.equal(commonAgent, startAgent)));
            expect(await wantAgent.equal(commonAgent, startAgent)).assertFalse();
            expect(commonButton.title).assertEqual('First');
            expect(startButton.title).assertEqual('Second');
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0018 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0019
         * @tc.name testWantAgent0019
         * @tc.desc 两种 operationType 取值不同：SEND_COMMON_EVENT 与 START_ABILITY 不相等
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level0
         */
        it('testWantAgent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0019 begin');
            let commonAgent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let startAgent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let commonType: number = await readOperationType(commonAgent);
            let startType: number = await readOperationType(startAgent);
            hilog.info(DOMAIN, TAG, 'common=%{public}d start=%{public}d, expected=not equal',
                commonType, startType);
            expect(commonType === startType).assertFalse();
            expect(commonType).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(startType).assertEqual(wantAgent.OperationType.START_ABILITY);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0019 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0020
         * @tc.name testWantAgent0020
         * @tc.desc 同一 util 实例先建公共事件、再建启动应用：先后顺序不影响各自的 operationType
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0020 begin');
            let commonAgent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let startAgent: WantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
            let commonType: number = await readOperationType(commonAgent);
            let startType: number = await readOperationType(startAgent);
            hilog.info(DOMAIN, TAG, 'common=%{public}d start=%{public}d, expected=%{public}d/%{public}d',
                commonType, startType, wantAgent.OperationType.SEND_COMMON_EVENT,
                wantAgent.OperationType.START_ABILITY);
            expect(commonType).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(startType).assertEqual(wantAgent.OperationType.START_ABILITY);
            expect(commonType === startType).assertFalse();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0020 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0021
         * @tc.name testWantAgent0021
         * @tc.desc 同参重复创建 3 对：每对等值（间接证明 requestCode 固定为 0）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level1
         */
        it('testWantAgent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0021 begin');
            let pairOne: boolean = await wantAgent.equal(
                await wantAgentUtil.createWantAgentForCommonEvent('action.a'),
                await wantAgentUtil.createWantAgentForCommonEvent('action.a'));
            let pairTwo: boolean = await wantAgent.equal(
                await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME),
                await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME));
            let pairThree: boolean = await wantAgent.equal(
                await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME),
                await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, 'MainAbility'));
            hilog.info(DOMAIN, TAG, 'pairs=%{public}s/%{public}s/%{public}s, expected=true/true/true',
                String(pairOne), String(pairTwo), String(pairThree));
            expect(pairOne).assertTrue();
            expect(pairTwo).assertTrue();
            expect(pairThree).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0021 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0022
         * @tc.name testWantAgent0022
         * @tc.desc 连续创建 10 个同参公共事件 agent：首尾等值，operationType 全部一致
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0022 begin');
            let agents: WantAgent[] = [];
            for (let i: number = 0; i < 10; i++) {
                agents.push(await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION));
            }
            let firstType: number = await readOperationType(agents[0]);
            let lastType: number = await readOperationType(agents[9]);
            hilog.info(DOMAIN, TAG, 'count=%{public}d first=%{public}d last=%{public}d, expected=10/equal/equal',
                agents.length, firstType, lastType);
            expect(agents.length).assertEqual(10);
            expect(firstType).assertEqual(lastType);
            expect(await wantAgent.equal(agents[0], agents[9])).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0022 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0023
         * @tc.name testWantAgent0023
         * @tc.desc 取消公共事件 agent 不抛异常；取消后 operationType 回读为 UNKNOWN_TYPE（实例已失效）
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0023 begin');
            let agent: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            expect(await readOperationType(agent)).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            let caught: boolean = false;
            try {
                await wantAgent.cancel(agent);
            } catch (error) {
                caught = true;
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancel(agent) rejected');
            }
            hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=false', String(caught));
            expect(caught).assertFalse();
            let typeAfter: number = await readOperationType(agent);
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                typeAfter, wantAgent.OperationType.UNKNOWN_TYPE);
            expect(typeAfter).assertEqual(wantAgent.OperationType.UNKNOWN_TYPE);
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0023 end');
        });

        /**
         * @tc.number SUB_CustomNotification_WANTAGENT_0024
         * @tc.name testWantAgent0024
         * @tc.desc 取消后重建同参 agent：新 agent 回读 SEND_COMMON_EVENT，与被取消的旧 agent 不等值
         * @tc.type Function
         * @tc.size SmallTest
         * @tc.level Level2
         */
        it('testWantAgent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0024 begin');
            let first: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            try {
                await wantAgent.cancel(first);
            } catch (error) {
                hilog.error(DOMAIN, TAG, '%{public}s', 'cancel(first) rejected, continue rebuild');
            }
            let second: WantAgent = await wantAgentUtil.createWantAgentForCommonEvent(COMMON_EVENT_ACTION);
            let secondType: number = await readOperationType(second);
            hilog.info(DOMAIN, TAG, 'operationType=%{public}d, expected=%{public}d',
                secondType, wantAgent.OperationType.SEND_COMMON_EVENT);
            expect(secondType).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
            let oldVsNew: boolean = await wantAgent.equal(first, second);
            hilog.info(DOMAIN, TAG, 'equal(first,second)=%{public}s, expected=false', String(oldVsNew));
            expect(oldVsNew).assertFalse();
            let newVsNew: boolean = await wantAgent.equal(second, second);
            hilog.info(DOMAIN, TAG, 'equal(second,second)=%{public}s, expected=true', String(newVsNew));
            expect(newVsNew).assertTrue();
            hilog.info(DOMAIN, TAG, '%{public}s', 'testWantAgent0024 end');
        });
    });
}
