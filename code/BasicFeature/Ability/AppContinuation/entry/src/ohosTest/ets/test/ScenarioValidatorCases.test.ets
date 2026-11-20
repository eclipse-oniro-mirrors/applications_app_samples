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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
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
     * @tc.name      com.samples.appcontinuation_ScenarioCatalogCases_0001
     * @tc.desc      Verify catalog shape is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_ScenarioCatalogCases_0001', 0, (): void => {
      loggedExpect(SCENARIO_CATALOG.length, 'ScenarioValidatorCases.test.ets:A0001', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(24);
      loggedExpect(scenarioIds().length, 'ScenarioValidatorCases.test.ets:A0002', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(24);
      loggedExpect(scenarioLines().length, 'ScenarioValidatorCases.test.ets:A0003', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(24);
      const audit = auditScenarios();
      loggedExpect(audit.findings.length, 'ScenarioValidatorCases.test.ets:A0004', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(0);
      loggedExpect(audit.ok, 'ScenarioValidatorCases.test.ets:A0005', BUNDLE + '_ScenarioCatalogCases_0001').assertTrue();
      loggedExpect(audit.summary(), 'ScenarioValidatorCases.test.ets:A0006', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual('场景目录自洽');
      SCENARIO_CATALOG.forEach((item: ScenarioEntry): void => {
        loggedExpect(item.steps.length > 0, 'ScenarioValidatorCases.test.ets:A0007', BUNDLE + '_ScenarioCatalogCases_0001').assertTrue();
        loggedExpect(item.requires.length > 0, 'ScenarioValidatorCases.test.ets:A0008', BUNDLE + '_ScenarioCatalogCases_0001').assertTrue();
        loggedExpect(item.success.length > 0, 'ScenarioValidatorCases.test.ets:A0009', BUNDLE + '_ScenarioCatalogCases_0001').assertTrue();
        loggedExpect(item.text().indexOf(item.scenarioId) === 0, 'ScenarioValidatorCases.test.ets:A0010', BUNDLE + '_ScenarioCatalogCases_0001').assertTrue();
      });
      loggedExpect(scenarioOf('SN-99'), 'ScenarioValidatorCases.test.ets:A0011', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(undefined);
      loggedExpect(scenarioOf('SN-01')?.shape, 'ScenarioValidatorCases.test.ets:A0012', BUNDLE + '_ScenarioCatalogCases_0001').assertEqual(PayloadShape.NOTE);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0200
     * @tc.name      com.samples.appcontinuation_ScenarioCatalogCases_0002
     * @tc.desc      Verify risk distribution matches catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_ScenarioCatalogCases_0002', 0, (): void => {
      const summary = summarizeScenarios();
      loggedExpect(summary.total, 'ScenarioValidatorCases.test.ets:A0013', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(24);
      loggedExpect(summary.high, 'ScenarioValidatorCases.test.ets:A0014', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(6);
      loggedExpect(summary.medium, 'ScenarioValidatorCases.test.ets:A0015', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(10);
      loggedExpect(summary.low, 'ScenarioValidatorCases.test.ets:A0016', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(8);
      loggedExpect(summary.steps, 'ScenarioValidatorCases.test.ets:A0017', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(51);
      loggedExpect(summary.highRatio(), 'ScenarioValidatorCases.test.ets:A0018', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(25);
      loggedExpect(summary.text().indexOf('共 24 个场景') === 0, 'ScenarioValidatorCases.test.ets:A0019', BUNDLE + '_ScenarioCatalogCases_0002').assertTrue();
      loggedExpect(scenariosOfRisk(ScenarioRisk.HIGH).length, 'ScenarioValidatorCases.test.ets:A0020', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(6);
      loggedExpect(highRiskScenarios().length, 'ScenarioValidatorCases.test.ets:A0021', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(6);
      loggedExpect(riskLabel(ScenarioRisk.MEDIUM), 'ScenarioValidatorCases.test.ets:A0022', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual('中');
      loggedExpect(riskOrder(ScenarioRisk.HIGH), 'ScenarioValidatorCases.test.ets:A0023', BUNDLE + '_ScenarioCatalogCases_0002').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0300
     * @tc.name      com.samples.appcontinuation_ScenarioCatalogCases_0003
     * @tc.desc      Verify shape coverage covers every shape
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ScenarioCatalogCases_0003', 0, (): void => {
      loggedExpect(scenariosOfShape(PayloadShape.NOTE).length, 'ScenarioValidatorCases.test.ets:A0024', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(14);
      loggedExpect(scenariosOfShape(PayloadShape.READING).length, 'ScenarioValidatorCases.test.ets:A0025', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(2);
      loggedExpect(scenariosOfShape(PayloadShape.FORM).length, 'ScenarioValidatorCases.test.ets:A0026', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(2);
      loggedExpect(scenariosOfShape(PayloadShape.CHECKLIST).length, 'ScenarioValidatorCases.test.ets:A0027', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(2);
      loggedExpect(scenariosOfShape(PayloadShape.MEDIA).length, 'ScenarioValidatorCases.test.ets:A0028', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(4);
      loggedExpect(shapeCoverageLines().length, 'ScenarioValidatorCases.test.ets:A0029', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual(5);
      loggedExpect(shapeCoverageLines()[0].indexOf('便签') === 0, 'ScenarioValidatorCases.test.ets:A0030', BUNDLE + '_ScenarioCatalogCases_0003').assertTrue();
      loggedExpect(shapeLabel(PayloadShape.FORM), 'ScenarioValidatorCases.test.ets:A0031', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual('表单草稿');
      loggedExpect(shapeLabel(PayloadShape.MEDIA), 'ScenarioValidatorCases.test.ets:A0032', BUNDLE + '_ScenarioCatalogCases_0003').assertEqual('媒体进度');
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0400
     * @tc.name      com.samples.appcontinuation_ScenarioCatalogCases_0004
     * @tc.desc      Verify device coverage matches directions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_ScenarioCatalogCases_0004', 0, (): void => {
      loggedExpect(scenariosFrom(DeviceClass.PHONE).length, 'ScenarioValidatorCases.test.ets:A0033', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(16);
      loggedExpect(scenariosTo(DeviceClass.PHONE).length, 'ScenarioValidatorCases.test.ets:A0034', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(10);
      loggedExpect(scenariosFrom(DeviceClass.WEARABLE).length, 'ScenarioValidatorCases.test.ets:A0035', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(1);
      loggedExpect(scenariosTo(DeviceClass.WEARABLE).length, 'ScenarioValidatorCases.test.ets:A0036', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(1);
      loggedExpect(scenariosFrom(DeviceClass.TV).length, 'ScenarioValidatorCases.test.ets:A0037', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(1);
      loggedExpect(deviceCoverageLines().length, 'ScenarioValidatorCases.test.ets:A0038', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(5);
      loggedExpect(deviceCoverageLines()[0].indexOf('phone：发起 16') === 0, 'ScenarioValidatorCases.test.ets:A0039', BUNDLE + '_ScenarioCatalogCases_0004').assertTrue();
      loggedExpect(sameDeviceScenarios().length, 'ScenarioValidatorCases.test.ets:A0040', BUNDLE + '_ScenarioCatalogCases_0004').assertEqual(2);
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENARIOCATALOGCASES_0500
     * @tc.name      com.samples.appcontinuation_ScenarioCatalogCases_0005
     * @tc.desc      Verify steps and step texts are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(BUNDLE + '_ScenarioCatalogCases_0005', 0, (): void => {
      loggedExpect(totalSteps(), 'ScenarioValidatorCases.test.ets:A0041', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(51);
      loggedExpect(stepCountOf('SN-01'), 'ScenarioValidatorCases.test.ets:A0042', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(3);
      loggedExpect(stepCountOf('SN-16'), 'ScenarioValidatorCases.test.ets:A0043', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(1);
      loggedExpect(stepCountOf('SN-99'), 'ScenarioValidatorCases.test.ets:A0044', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(0);
      loggedExpect(scenarioStepLines().length, 'ScenarioValidatorCases.test.ets:A0045', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(51);
      loggedExpect(scenarioStepLines()[0], 'ScenarioValidatorCases.test.ets:A0046', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual('SN-01-1 在手机打开便签');
      const first: ScenarioEntry | undefined = scenarioOf('SN-01');
      loggedExpect(first !== undefined, 'ScenarioValidatorCases.test.ets:A0047', BUNDLE + '_ScenarioCatalogCases_0005').assertTrue();
      const texts: string[] = first === undefined ? [] : first.stepTexts();
      loggedExpect(texts.length, 'ScenarioValidatorCases.test.ets:A0048', BUNDLE + '_ScenarioCatalogCases_0005').assertEqual(3);
      loggedExpect(texts[2].indexOf('SN-01-3') === 0, 'ScenarioValidatorCases.test.ets:A0049', BUNDLE + '_ScenarioCatalogCases_0005').assertTrue();
    });
  });

  describe('PayloadValidatorCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0100
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0001
     * @tc.desc      Verify rule tables are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(BUNDLE + '_PayloadValidatorCases_0001', 0, (): void => {
      loggedExpect(FIELD_RULES.length, 'ScenarioValidatorCases.test.ets:A0050', BUNDLE + '_PayloadValidatorCases_0001').assertEqual(16);
      loggedExpect(CROSS_RULES.length, 'ScenarioValidatorCases.test.ets:A0051', BUNDLE + '_PayloadValidatorCases_0001').assertEqual(9);
      loggedExpect(fieldRuleLines().length, 'ScenarioValidatorCases.test.ets:A0052', BUNDLE + '_PayloadValidatorCases_0001').assertEqual(16);
      loggedExpect(crossRuleLines().length, 'ScenarioValidatorCases.test.ets:A0053', BUNDLE + '_PayloadValidatorCases_0001').assertEqual(9);
      const audit = auditValidator();
      loggedExpect(audit.findings.length, 'ScenarioValidatorCases.test.ets:A0054', BUNDLE + '_PayloadValidatorCases_0001').assertEqual(0);
      loggedExpect(audit.ok, 'ScenarioValidatorCases.test.ets:A0055', BUNDLE + '_PayloadValidatorCases_0001').assertTrue();
      loggedExpect(audit.summary(), 'ScenarioValidatorCases.test.ets:A0056', BUNDLE + '_PayloadValidatorCases_0001').assertEqual('校验规则表自洽');
      FIELD_RULES.forEach((rule: FieldRule): void => {
        loggedExpect(rule.text().indexOf(rule.ruleId) === 0, 'ScenarioValidatorCases.test.ets:A0057', BUNDLE + '_PayloadValidatorCases_0001').assertTrue();
        loggedExpect(rule.message.length > 0, 'ScenarioValidatorCases.test.ets:A0058', BUNDLE + '_PayloadValidatorCases_0001').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0200
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0002
     * @tc.desc      Verify valid payload passes everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0002', 0, (): void => {
      const data: PayloadData = valid();
      const result = validate(data, NOW);
      loggedExpect(result.clean(), 'ScenarioValidatorCases.test.ets:A0059', BUNDLE + '_PayloadValidatorCases_0002').assertTrue();
      loggedExpect(result.hasError(), 'ScenarioValidatorCases.test.ets:A0060', BUNDLE + '_PayloadValidatorCases_0002').assertFalse();
      loggedExpect(result.warnOnly(), 'ScenarioValidatorCases.test.ets:A0061', BUNDLE + '_PayloadValidatorCases_0002').assertFalse();
      loggedExpect(result.violations.length, 'ScenarioValidatorCases.test.ets:A0062', BUNDLE + '_PayloadValidatorCases_0002').assertEqual(0);
      loggedExpect(result.headline(), 'ScenarioValidatorCases.test.ets:A0063', BUNDLE + '_PayloadValidatorCases_0002').assertEqual('校验通过');
      loggedExpect(validateFields(data).clean(), 'ScenarioValidatorCases.test.ets:A0064', BUNDLE + '_PayloadValidatorCases_0002').assertTrue();
      loggedExpect(result.ruleIds().length, 'ScenarioValidatorCases.test.ets:A0065', BUNDLE + '_PayloadValidatorCases_0002').assertEqual(0);
      loggedExpect(valueOfField(data, 'doc'), 'ScenarioValidatorCases.test.ets:A0066', BUNDLE + '_PayloadValidatorCases_0002').assertEqual('doc-1');
      loggedExpect(valueOfField(data, 'missing'), 'ScenarioValidatorCases.test.ets:A0067', BUNDLE + '_PayloadValidatorCases_0002').assertEqual('');
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0300
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0003
     * @tc.desc      Verify field errors are detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0003', 0, (): void => {
      const data: PayloadData = new PayloadData('', -1);
      data.body = '';
      data.cs = -5;
      data.ce = 0;
      data.at = -1;
      data.dev = 'bad id!';
      data.ck = 'weird';
      const result = validateFields(data);
      loggedExpect(result.hasError(), 'ScenarioValidatorCases.test.ets:A0068', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.ruleIds().indexOf('VF-01') >= 0, 'ScenarioValidatorCases.test.ets:A0069', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.ruleIds().indexOf('VF-04') >= 0, 'ScenarioValidatorCases.test.ets:A0070', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.ruleIds().indexOf('VF-08') >= 0, 'ScenarioValidatorCases.test.ets:A0071', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.ruleIds().indexOf('VF-12') >= 0, 'ScenarioValidatorCases.test.ets:A0072', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.ruleIds().indexOf('VF-14') >= 0, 'ScenarioValidatorCases.test.ets:A0073', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.errors() >= 5, 'ScenarioValidatorCases.test.ets:A0074', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
      loggedExpect(result.headline().indexOf('项错误') > 0, 'ScenarioValidatorCases.test.ets:A0075', BUNDLE + '_PayloadValidatorCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0400
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0004
     * @tc.desc      Verify length rules split error and warning
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0004', 0, (): void => {
      const longBody: PayloadData = valid();
      longBody.body = 'x'.repeat(2000);
      longBody.ce = 2000;
      const warn = validateFields(longBody);
      loggedExpect(warn.hasError(), 'ScenarioValidatorCases.test.ets:A0076', BUNDLE + '_PayloadValidatorCases_0004').assertFalse();
      loggedExpect(warn.ruleIds().indexOf('VF-16') >= 0, 'ScenarioValidatorCases.test.ets:A0077', BUNDLE + '_PayloadValidatorCases_0004').assertTrue();
      loggedExpect(warn.warnOnly(), 'ScenarioValidatorCases.test.ets:A0078', BUNDLE + '_PayloadValidatorCases_0004').assertTrue();
      loggedExpect(warn.headline(), 'ScenarioValidatorCases.test.ets:A0079', BUNDLE + '_PayloadValidatorCases_0004').assertEqual('1 项告警');
      const tooLong: PayloadData = valid();
      tooLong.body = 'x'.repeat(5000);
      tooLong.ce = 5000;
      const error = validateFields(tooLong);
      loggedExpect(error.hasError(), 'ScenarioValidatorCases.test.ets:A0080', BUNDLE + '_PayloadValidatorCases_0004').assertTrue();
      loggedExpect(error.ruleIds().indexOf('VF-07') >= 0, 'ScenarioValidatorCases.test.ets:A0081', BUNDLE + '_PayloadValidatorCases_0004').assertTrue();
      const longTitle: PayloadData = valid();
      longTitle.title = 'y'.repeat(80);
      loggedExpect(validateFields(longTitle).ruleIds().indexOf('VF-06') >= 0, 'ScenarioValidatorCases.test.ets:A0082', BUNDLE + '_PayloadValidatorCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0500
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0005
     * @tc.desc      Verify cross rules detect relationship errors
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0005', 0, (): void => {
      const reversed: PayloadData = valid();
      reversed.cs = 6;
      reversed.ce = 2;
      const reversedResult = validate(reversed, NOW);
      loggedExpect(reversedResult.ruleIds().indexOf('VX-01') >= 0, 'ScenarioValidatorCases.test.ets:A0083', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
      const beyond: PayloadData = valid();
      beyond.body = '短';
      beyond.cs = 0;
      beyond.ce = 10;
      const beyondResult = validate(beyond, NOW);
      loggedExpect(beyondResult.ruleIds().indexOf('VX-02') >= 0, 'ScenarioValidatorCases.test.ets:A0084', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
      const future: PayloadData = valid();
      future.at = NOW + 3600000;
      loggedExpect(validate(future, NOW).ruleIds().indexOf('VX-07') >= 0, 'ScenarioValidatorCases.test.ets:A0085', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
      const unsigned: PayloadData = valid();
      unsigned.sig = '';
      loggedExpect(validate(unsigned, NOW).ruleIds().indexOf('VX-05') >= 0, 'ScenarioValidatorCases.test.ets:A0086', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
      const wrongSig: PayloadData = valid();
      wrongSig.sig = '00000000';
      loggedExpect(validate(wrongSig, NOW).ruleIds().indexOf('VX-06') >= 0, 'ScenarioValidatorCases.test.ets:A0087', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
      const zeroRev: PayloadData = valid();
      zeroRev.rev = 0;
      loggedExpect(validate(zeroRev, NOW).ruleIds().indexOf('VX-04') >= 0, 'ScenarioValidatorCases.test.ets:A0088', BUNDLE + '_PayloadValidatorCases_0005').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0600
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0006
     * @tc.desc      Verify result helpers summarize states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0006', 0, (): void => {
      const clean = validate(valid(), NOW);
      loggedExpect(clean.errors(), 'ScenarioValidatorCases.test.ets:A0089', BUNDLE + '_PayloadValidatorCases_0006').assertEqual(0);
      loggedExpect(clean.warnings(), 'ScenarioValidatorCases.test.ets:A0090', BUNDLE + '_PayloadValidatorCases_0006').assertEqual(0);
      loggedExpect(clean.text(), 'ScenarioValidatorCases.test.ets:A0091', BUNDLE + '_PayloadValidatorCases_0006').assertEqual('校验通过');
      const broken: PayloadData = new PayloadData('', 1);
      broken.ck = 'bad';
      const result = validate(broken, NOW);
      loggedExpect(result.errors() > 0, 'ScenarioValidatorCases.test.ets:A0092', BUNDLE + '_PayloadValidatorCases_0006').assertTrue();
      loggedExpect(result.text().split('\n').length, 'ScenarioValidatorCases.test.ets:A0093', BUNDLE + '_PayloadValidatorCases_0006').assertEqual(result.violations.length + 1);
      loggedExpect(result.ruleIds().length > 0, 'ScenarioValidatorCases.test.ets:A0094', BUNDLE + '_PayloadValidatorCases_0006').assertTrue();
      result.violations.forEach((item): void => {
        loggedExpect(item.text().indexOf(item.ruleId) === 0, 'ScenarioValidatorCases.test.ets:A0095', BUNDLE + '_PayloadValidatorCases_0006').assertTrue();
        loggedExpect(ValidationLevel.ERROR !== undefined, 'ScenarioValidatorCases.test.ets:A0096', BUNDLE + '_PayloadValidatorCases_0006').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_CONTINUATION_PAYLOADVALIDATORCASES_0700
     * @tc.name      com.samples.appcontinuation_PayloadValidatorCases_0007
     * @tc.desc      Verify single rule evaluation is exposed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_PayloadValidatorCases_0007', 0, (): void => {
      const data: PayloadData = valid();
      const required: FieldRule = FIELD_RULES[0];
      loggedExpect(passesFieldRule(required, data), 'ScenarioValidatorCases.test.ets:A0097', BUNDLE + '_PayloadValidatorCases_0007').assertTrue();
      const pattern: FieldRule = FIELD_RULES[1];
      loggedExpect(passesFieldRule(pattern, data), 'ScenarioValidatorCases.test.ets:A0098', BUNDLE + '_PayloadValidatorCases_0007').assertTrue();
      const brokenDoc: PayloadData = valid();
      brokenDoc.doc = 'has space';
      loggedExpect(passesFieldRule(pattern, brokenDoc), 'ScenarioValidatorCases.test.ets:A0099', BUNDLE + '_PayloadValidatorCases_0007').assertFalse();
      const minRule: FieldRule = FIELD_RULES[3];
      loggedExpect(passesFieldRule(minRule, data), 'ScenarioValidatorCases.test.ets:A0100', BUNDLE + '_PayloadValidatorCases_0007').assertTrue();
      brokenDoc.rev = -1;
      loggedExpect(passesFieldRule(minRule, brokenDoc), 'ScenarioValidatorCases.test.ets:A0101', BUNDLE + '_PayloadValidatorCases_0007').assertFalse();
      const enumRule: FieldRule = FIELD_RULES[13];
      loggedExpect(enumRule.kind, 'ScenarioValidatorCases.test.ets:A0102', BUNDLE + '_PayloadValidatorCases_0007').assertEqual(CheckKind.ENUM);
      loggedExpect(passesFieldRule(enumRule, data), 'ScenarioValidatorCases.test.ets:A0103', BUNDLE + '_PayloadValidatorCases_0007').assertTrue();
      brokenDoc.ck = 'nope';
      loggedExpect(passesFieldRule(enumRule, brokenDoc), 'ScenarioValidatorCases.test.ets:A0104', BUNDLE + '_PayloadValidatorCases_0007').assertFalse();
    });
  });
}
