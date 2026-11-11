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

import { describe, expect, it } from '@ohos/hypium';
import {
  PayloadShape, SCENARIO_CATALOG, ScenarioEntry, ScenarioRisk, auditScenarios,
  deviceCoverageLines, highRiskScenarios, riskLabel, riskOrder, sameDeviceScenarios,
  scenarioIds, scenarioLines, scenarioOf, scenarioStepLines, scenariosFrom, scenariosOfRisk,
  scenariosOfShape, scenariosTo, shapeCoverageLines, shapeLabel, stepCountOf, summarizeScenarios,
  totalSteps
} from '../../../main/ets/learning/guide/ScenarioCatalog';
import {
  CROSS_RULES, CheckKind, FIELD_RULES, FieldRule, ValidationLevel, auditValidator,
  crossRuleLines, fieldRuleLines, passesFieldRule, validate, validateFields, valueOfField
} from '../../../main/ets/learning/payload/PayloadValidator';
import { PayloadData, sealPayload } from '../../../main/ets/learning/payload/PayloadCodec';
import { DeviceClass } from '../../../main/ets/learning/rules/ContinuationRules';

const NOW: number = 1700000000000;

function valid(): PayloadData {
  const data: PayloadData = new PayloadData('doc-1', 3);
  data.title = '示例标题';
  data.body = '第一行\n第二行';
  data.cs = 1;
  data.ce = 4;
  data.dev = 'device-a';
  data.at = NOW;
  data.app = '1.0.0';
  return sealPayload(data);
}

export default function scenarioValidatorCasesTest(): void {
  describe('ScenarioCatalogCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0100
     * @tc.name      testScenarioCatalogCases0001
     * @tc.desc      Verify catalog shape is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testScenarioCatalogCases0001', 0, (): void => {
      expect(SCENARIO_CATALOG.length).assertEqual(24);
      expect(scenarioIds().length).assertEqual(24);
      expect(scenarioLines().length).assertEqual(24);
      const audit = auditScenarios();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('场景目录自洽');
      SCENARIO_CATALOG.forEach((item: ScenarioEntry): void => {
        expect(item.steps.length > 0).assertTrue();
        expect(item.requires.length > 0).assertTrue();
        expect(item.success.length > 0).assertTrue();
        expect(item.text().indexOf(item.scenarioId) === 0).assertTrue();
      });
      expect(scenarioOf('SN-99')).assertEqual(undefined);
      expect(scenarioOf('SN-01')?.shape).assertEqual(PayloadShape.NOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0200
     * @tc.name      testScenarioCatalogCases0002
     * @tc.desc      Verify risk distribution matches catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testScenarioCatalogCases0002', 0, (): void => {
      const summary = summarizeScenarios();
      expect(summary.total).assertEqual(24);
      expect(summary.high).assertEqual(6);
      expect(summary.medium).assertEqual(10);
      expect(summary.low).assertEqual(8);
      expect(summary.steps).assertEqual(51);
      expect(summary.highRatio()).assertEqual(25);
      expect(summary.text().indexOf('共 24 个场景') === 0).assertTrue();
      expect(scenariosOfRisk(ScenarioRisk.HIGH).length).assertEqual(6);
      expect(highRiskScenarios().length).assertEqual(6);
      expect(riskLabel(ScenarioRisk.MEDIUM)).assertEqual('中');
      expect(riskOrder(ScenarioRisk.HIGH)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0300
     * @tc.name      testScenarioCatalogCases0003
     * @tc.desc      Verify shape coverage covers every shape
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testScenarioCatalogCases0003', 0, (): void => {
      expect(scenariosOfShape(PayloadShape.NOTE).length).assertEqual(14);
      expect(scenariosOfShape(PayloadShape.READING).length).assertEqual(2);
      expect(scenariosOfShape(PayloadShape.FORM).length).assertEqual(2);
      expect(scenariosOfShape(PayloadShape.CHECKLIST).length).assertEqual(2);
      expect(scenariosOfShape(PayloadShape.MEDIA).length).assertEqual(4);
      expect(shapeCoverageLines().length).assertEqual(5);
      expect(shapeCoverageLines()[0].indexOf('便签') === 0).assertTrue();
      expect(shapeLabel(PayloadShape.FORM)).assertEqual('表单草稿');
      expect(shapeLabel(PayloadShape.MEDIA)).assertEqual('媒体进度');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0400
     * @tc.name      testScenarioCatalogCases0004
     * @tc.desc      Verify device coverage matches directions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testScenarioCatalogCases0004', 0, (): void => {
      expect(scenariosFrom(DeviceClass.PHONE).length).assertEqual(16);
      expect(scenariosTo(DeviceClass.PHONE).length).assertEqual(10);
      expect(scenariosFrom(DeviceClass.WEARABLE).length).assertEqual(1);
      expect(scenariosTo(DeviceClass.WEARABLE).length).assertEqual(1);
      expect(scenariosFrom(DeviceClass.TV).length).assertEqual(1);
      expect(deviceCoverageLines().length).assertEqual(5);
      expect(deviceCoverageLines()[0].indexOf('phone：发起 16') === 0).assertTrue();
      expect(sameDeviceScenarios().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0500
     * @tc.name      testScenarioCatalogCases0005
     * @tc.desc      Verify steps and step texts are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testScenarioCatalogCases0005', 0, (): void => {
      expect(totalSteps()).assertEqual(51);
      expect(stepCountOf('SN-01')).assertEqual(3);
      expect(stepCountOf('SN-16')).assertEqual(1);
      expect(stepCountOf('SN-99')).assertEqual(0);
      expect(scenarioStepLines().length).assertEqual(51);
      expect(scenarioStepLines()[0]).assertEqual('SN-01-1 在手机打开便签');
      const first: ScenarioEntry | undefined = scenarioOf('SN-01');
      expect(first !== undefined).assertTrue();
      const texts: string[] = first === undefined ? [] : first.stepTexts();
      expect(texts.length).assertEqual(3);
      expect(texts[2].indexOf('SN-01-3') === 0).assertTrue();
    });
  });

  describe('PayloadValidatorCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0100
     * @tc.name      testPayloadValidatorCases0001
     * @tc.desc      Verify rule tables are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testPayloadValidatorCases0001', 0, (): void => {
      expect(FIELD_RULES.length).assertEqual(16);
      expect(CROSS_RULES.length).assertEqual(9);
      expect(fieldRuleLines().length).assertEqual(16);
      expect(crossRuleLines().length).assertEqual(9);
      const audit = auditValidator();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('校验规则表自洽');
      FIELD_RULES.forEach((rule: FieldRule): void => {
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
        expect(rule.message.length > 0).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0200
     * @tc.name      testPayloadValidatorCases0002
     * @tc.desc      Verify valid payload passes everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0002', 0, (): void => {
      const data: PayloadData = valid();
      const result = validate(data, NOW);
      expect(result.clean()).assertTrue();
      expect(result.hasError()).assertFalse();
      expect(result.warnOnly()).assertFalse();
      expect(result.violations.length).assertEqual(0);
      expect(result.headline()).assertEqual('校验通过');
      expect(validateFields(data).clean()).assertTrue();
      expect(result.ruleIds().length).assertEqual(0);
      expect(valueOfField(data, 'doc')).assertEqual('doc-1');
      expect(valueOfField(data, 'missing')).assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0300
     * @tc.name      testPayloadValidatorCases0003
     * @tc.desc      Verify field errors are detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0003', 0, (): void => {
      const data: PayloadData = new PayloadData('', -1);
      data.body = '';
      data.cs = -5;
      data.ce = 0;
      data.at = -1;
      data.dev = 'bad id!';
      data.ck = 'weird';
      const result = validateFields(data);
      expect(result.hasError()).assertTrue();
      expect(result.ruleIds().indexOf('VF-01') >= 0).assertTrue();
      expect(result.ruleIds().indexOf('VF-04') >= 0).assertTrue();
      expect(result.ruleIds().indexOf('VF-08') >= 0).assertTrue();
      expect(result.ruleIds().indexOf('VF-12') >= 0).assertTrue();
      expect(result.ruleIds().indexOf('VF-14') >= 0).assertTrue();
      expect(result.errors() >= 5).assertTrue();
      expect(result.headline().indexOf('项错误') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0400
     * @tc.name      testPayloadValidatorCases0004
     * @tc.desc      Verify length rules split error and warning
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0004', 0, (): void => {
      const longBody: PayloadData = valid();
      longBody.body = 'x'.repeat(2000);
      longBody.ce = 2000;
      const warn = validateFields(longBody);
      expect(warn.hasError()).assertFalse();
      expect(warn.ruleIds().indexOf('VF-16') >= 0).assertTrue();
      expect(warn.warnOnly()).assertTrue();
      expect(warn.headline()).assertEqual('1 项告警');
      const tooLong: PayloadData = valid();
      tooLong.body = 'x'.repeat(5000);
      tooLong.ce = 5000;
      const error = validateFields(tooLong);
      expect(error.hasError()).assertTrue();
      expect(error.ruleIds().indexOf('VF-07') >= 0).assertTrue();
      const longTitle: PayloadData = valid();
      longTitle.title = 'y'.repeat(80);
      expect(validateFields(longTitle).ruleIds().indexOf('VF-06') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0500
     * @tc.name      testPayloadValidatorCases0005
     * @tc.desc      Verify cross rules detect relationship errors
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0005', 0, (): void => {
      const reversed: PayloadData = valid();
      reversed.cs = 6;
      reversed.ce = 2;
      const reversedResult = validate(reversed, NOW);
      expect(reversedResult.ruleIds().indexOf('VX-01') >= 0).assertTrue();
      const beyond: PayloadData = valid();
      beyond.body = '短';
      beyond.cs = 0;
      beyond.ce = 10;
      const beyondResult = validate(beyond, NOW);
      expect(beyondResult.ruleIds().indexOf('VX-02') >= 0).assertTrue();
      const future: PayloadData = valid();
      future.at = NOW + 3600000;
      expect(validate(future, NOW).ruleIds().indexOf('VX-07') >= 0).assertTrue();
      const unsigned: PayloadData = valid();
      unsigned.sig = '';
      expect(validate(unsigned, NOW).ruleIds().indexOf('VX-05') >= 0).assertTrue();
      const wrongSig: PayloadData = valid();
      wrongSig.sig = '00000000';
      expect(validate(wrongSig, NOW).ruleIds().indexOf('VX-06') >= 0).assertTrue();
      const zeroRev: PayloadData = valid();
      zeroRev.rev = 0;
      expect(validate(zeroRev, NOW).ruleIds().indexOf('VX-04') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0600
     * @tc.name      testPayloadValidatorCases0006
     * @tc.desc      Verify result helpers summarize states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0006', 0, (): void => {
      const clean = validate(valid(), NOW);
      expect(clean.errors()).assertEqual(0);
      expect(clean.warnings()).assertEqual(0);
      expect(clean.text()).assertEqual('校验通过');
      const broken: PayloadData = new PayloadData('', 1);
      broken.ck = 'bad';
      const result = validate(broken, NOW);
      expect(result.errors() > 0).assertTrue();
      expect(result.text().split('\n').length).assertEqual(result.violations.length + 1);
      expect(result.ruleIds().length > 0).assertTrue();
      result.violations.forEach((item): void => {
        expect(item.text().indexOf(item.ruleId) === 0).assertTrue();
        expect(ValidationLevel.ERROR !== undefined).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0700
     * @tc.name      testPayloadValidatorCases0007
     * @tc.desc      Verify single rule evaluation is exposed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPayloadValidatorCases0007', 0, (): void => {
      const data: PayloadData = valid();
      const required: FieldRule = FIELD_RULES[0];
      expect(passesFieldRule(required, data)).assertTrue();
      const pattern: FieldRule = FIELD_RULES[1];
      expect(passesFieldRule(pattern, data)).assertTrue();
      const brokenDoc: PayloadData = valid();
      brokenDoc.doc = 'has space';
      expect(passesFieldRule(pattern, brokenDoc)).assertFalse();
      const minRule: FieldRule = FIELD_RULES[3];
      expect(passesFieldRule(minRule, data)).assertTrue();
      brokenDoc.rev = -1;
      expect(passesFieldRule(minRule, brokenDoc)).assertFalse();
      const enumRule: FieldRule = FIELD_RULES[13];
      expect(enumRule.kind).assertEqual(CheckKind.ENUM);
      expect(passesFieldRule(enumRule, data)).assertTrue();
      brokenDoc.ck = 'nope';
      expect(passesFieldRule(enumRule, brokenDoc)).assertFalse();
    });
  });
}
