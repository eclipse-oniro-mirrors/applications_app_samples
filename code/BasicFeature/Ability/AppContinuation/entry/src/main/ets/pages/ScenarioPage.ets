import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningDisclosure, learningError } from '../components/LearningUi';
import {
  PayloadShape, SCENARIO_CATALOG, ScenarioEntry, auditScenarios, deviceCoverageLines,
  highRiskScenarios, scenarioLines, scenarioStepLines, shapeCoverageLines, summarizeScenarios
} from '../learning/guide/ScenarioCatalog';
import {
  CROSS_RULES, FIELD_RULES, auditValidator, crossRuleLines, fieldRuleLines, validate
} from '../learning/payload/PayloadValidator';
import { PayloadData, encodePayload, sealPayload, sizeOf } from '../learning/payload/PayloadCodec';
import { PAYLOAD_VERSION } from '../learning/payload/PayloadSchema';
import {
  FIELD_DOCS, auditDictionary, describeValue, dictionaryLines, missingSchemaKeys, roleLines
} from '../learning/payload/FieldDictionary';
import {
  RetryReason, auditRetryRules, defaultRule, delayOf, reasonLines, ruleLines, simulate,
  totalWait
} from '../learning/session/RetryPolicy';

@Entry
@Component
struct ScenarioPage {
  @State private scenarioLinesState: string[] = [];
  @State private stepLinesState: string[] = [];
  @State private validatorLinesState: string[] = [];
  @State private sampleLinesState: string[] = [];
  @State private dictionaryLinesState: string[] = [];
  @State private retryLinesState: string[] = [];
  @State private headline: string = '';
  @State private navigationMessage: string = '';

  aboutToAppear(): void {
    this.rebuild();
  }

  onPageShow(): void {
    this.rebuild();
  }

  private samplePayload(): PayloadData {
    const data: PayloadData = new PayloadData('scenario-doc', 3);
    data.title = '场景示例';
    data.body = '第一行示例内容\n第二行示例内容';
    data.cs = 2;
    data.ce = 8;
    data.dev = 'local-device';
    data.at = 1700000000000;
    data.app = '1.0.0';
    return sealPayload(data);
  }

  private rebuild(): void {
    const summary = summarizeScenarios();
    this.headline = `${summary.text()}｜${auditScenarios().summary()}`;
    const lines: string[] = scenarioLines();
    shapeCoverageLines().forEach((line: string): void => {
      lines.push(line);
    });
    deviceCoverageLines().forEach((line: string): void => {
      lines.push(line);
    });
    lines.push(`高风险场景 ${highRiskScenarios().length} 个`);
    this.scenarioLinesState = lines;
    this.stepLinesState = scenarioStepLines();

    const validator: string[] = fieldRuleLines();
    crossRuleLines().forEach((line: string): void => {
      validator.push(line);
    });
    validator.push(auditValidator().summary());
    validator.push(`字段规则 ${FIELD_RULES.length} 条，跨字段规则 ${CROSS_RULES.length} 条`);
    this.validatorLinesState = validator;

    const sample: PayloadData = this.samplePayload();
    const result = validate(sample, Date.now());
    const sampleLines: string[] = [];
    sampleLines.push(`载荷版本 v${PAYLOAD_VERSION}，示例编码 ${encodePayload(sample).length} 字符`);
    sampleLines.push(sizeOf(sample).text());
    sampleLines.push(`校验结论：${result.headline()}`);
    result.violations.forEach((violation): void => {
      sampleLines.push(violation.text());
    });
    sampleLines.push(`场景总数 ${SCENARIO_CATALOG.length}，形态 ${PayloadShape.NOTE as string} 起`);
    this.sampleLinesState = sampleLines;

    const dictionary: string[] = dictionaryLines();
    roleLines().forEach((line: string): void => {
      dictionary.push(line);
    });
    ['doc', 'title', 'body', 'ck', 'bodyLength', 'selectionLength', 'conflictText'].forEach(
      (key: string): void => {
        dictionary.push(describeValue(sample, key));
      });
    dictionary.push(`字典字段 ${FIELD_DOCS.length} 个，缺失映射 ${missingSchemaKeys().length} 个`);
    dictionary.push(auditDictionary().summary());
    this.dictionaryLinesState = dictionary;

    const retry: string[] = [];
    reasonLines().forEach((line: string): void => {
      retry.push(line);
    });
    ruleLines().forEach((line: string): void => {
      retry.push(line);
    });
    const network = defaultRule(RetryReason.NETWORK);
    retry.push(`网络退避：第 1 次 ${delayOf(network, 1)} ms，第 2 次 ${delayOf(network, 2)} ms，` +
      `累计 ${totalWait(network)} ms`);
    const trace = simulate(network, 3);
    retry.push(trace.text());
    trace.lines().forEach((line: string): void => {
      retry.push(line);
    });
    retry.push(auditRetryRules().summary());
    this.retryLinesState = retry;
  }

  private canOpenBusiness(): boolean {
    const controller = getLearningController();
    return controller !== undefined && controller.snapshot().canEdit;
  }

  private openBusiness(kind: string, page: string): void {
    this.navigationMessage = '';
    const controller = getLearningController();
    if (controller === undefined) { this.navigationMessage = '运行对象尚未初始化。'; return; }
    try {
      if (!controller.openScene(kind)) {
        const error = controller.sceneWorkbench.snapshot().error;
        this.navigationMessage = controller.snapshot().canEdit && error.length > 0 ? error : '当前不能切换业务场景。';
        return;
      }
      router.pushUrl({ url: page }).catch((error: BusinessError): void => {
        this.navigationMessage = `页面未打开：${learningError(error)}`;
      });
    } catch (error) { this.navigationMessage = `页面未打开：${learningError(error as BusinessError)}`; }
  }

  @Builder
  private card(title: string, lines: string[]) {
    LearningDisclosure({ title: title }) {
      Column({ space: 10 }) {
        ForEach(lines, (line: string) => {
          Text(line).fontSize(14).lineHeight(22).fontColor('#667085').width('100%')
        }, (line: string) => line)
      }.width('100%')
    }
  }

  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button('‹ 返回', { type: ButtonType.Normal })
          .height(44).fontSize(14)
          .fontColor('#2563EB')
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .padding({ left: 14, right: 14, top: 10, bottom: 10 })
          .onClick(() => router.back())

        Text('场景与校验')
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .fontColor('#182238')
          .width('100%')
        Text(this.headline)
          .fontSize(14)
          .fontColor('#667085')
          .width('100%')

        Row({ space: 10 }) {
          Button('打开笔记场景', { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#2563EB')
            .borderRadius(10)
            .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('note', 'pages/NoteScenePage'); })
          Button('打开阅读场景', { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor('#2563EB')
            .backgroundColor('#EEF4FF')
            .borderRadius(10)
            .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('reading', 'pages/ReadingScenePage'); })
        }
        .width('100%')

        Button('打开表单场景', { type: ButtonType.Normal })
          .width('100%')
          .height(44)
          .fontSize(14)
          .fontColor('#2563EB')
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('form', 'pages/FormScenePage'); })

        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage).fontSize(14).fontColor('#B42318').width('100%')
        }
        this.card('场景目录', this.scenarioLinesState)
        this.card('执行步骤', this.stepLinesState)
        this.card('校验规则', this.validatorLinesState)
        this.card('示例载荷校验', this.sampleLinesState)
        this.card('字段字典', this.dictionaryLinesState)
        this.card('重试策略', this.retryLinesState)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .scrollBar(BarState.Auto).align(Alignment.TopStart)
  }
}
