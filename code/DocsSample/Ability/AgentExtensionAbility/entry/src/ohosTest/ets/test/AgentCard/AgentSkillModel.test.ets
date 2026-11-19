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

import { describe, it, expect, beforeEach, afterEach } from '@ohos/hypium';
import profile from '../../../../main/resources/base/profile/agent_config.json';

// Read the production JSON profile instead of asserting a test-only card mirror.
export default function agentSkillModelTest(): void {
  describe('AgentProductionProfile', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    it('declaresTheWeatherAgentIdentity', 0, () => {
      expect(profile.agentCards.length).assertEqual(1);
      expect(profile.agentCards[0].agentId).assertEqual('weather_assistant_001');
      expect(profile.agentCards[0].name).assertEqual('WeatherAssistant');
      expect(profile.agentCards[0].version).assertEqual('1.0.0');
    });
    it('declaresProviderAndDocumentationUrls', 0, () => {
      const card = profile.agentCards[0];
      expect(card.provider.organization).assertEqual('Example Weather Inc.');
      expect(card.provider.url).assertEqual('https://example.com');
      expect(card.documentationUrl).assertEqual('https://example.com/docs/weather-agent');
    });
    it('declaresSampleCapabilitiesWithoutInventedBusinessLogic', 0, () => {
      const capabilities = profile.agentCards[0].capabilities;
      expect(capabilities.streaming).assertTrue();
      expect(capabilities.pushNotifications).assertTrue();
      expect(capabilities.stateTransitionHistory).assertTrue();
      expect(capabilities.extendedAgentCard).assertFalse();
      expect(capabilities.extension).assertEqual('custom_protocol_v1');
    });
    it('declaresTheTwoRealWeatherSkillsInOrder', 0, () => {
      const skills = profile.agentCards[0].skills;
      expect(skills.length).assertEqual(2);
      expect(skills[0].id).assertEqual('get_weather');
      expect(skills[1].id).assertEqual('weather_forecast');
      expect(skills[0].name).assertEqual('获取天气');
      expect(skills[1].name).assertEqual('天气预报');
    });
    it('declaresSkillInputAndOutputModes', 0, () => {
      const skills = profile.agentCards[0].skills;
      for (let index = 0; index < skills.length; index++) {
        expect(skills[index].inputModes.length).assertEqual(1);
        expect(skills[index].inputModes[0]).assertEqual('text/plain');
        expect(skills[index].outputModes.length).assertEqual(2);
        expect(skills[index].outputModes[0]).assertEqual('text/plain');
        expect(skills[index].outputModes[1]).assertEqual('application/json');
      }
    });
    it('declaresProfileLevelModesAndDeviceTypes', 0, () => {
      const card = profile.agentCards[0];
      expect(card.defaultInputModes.length).assertEqual(2);
      expect(card.defaultInputModes[0]).assertEqual('text/plain');
      expect(card.defaultInputModes[1]).assertEqual('audio/wav');
      expect(card.defaultOutputModes[1]).assertEqual('application/json');
      expect(card.appInfo.deviceTypes[0]).assertEqual('phone');
      expect(card.appInfo.deviceTypes[1]).assertEqual('tablet');
      expect(card.appInfo.minAppVersion).assertEqual('1.0.0');
    });
  });
}
