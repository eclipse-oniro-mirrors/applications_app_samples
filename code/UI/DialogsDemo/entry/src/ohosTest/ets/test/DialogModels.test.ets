import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { IconStyle, TitlePosition, BottomOffset } from '@kit.ArkUI';
import {
  DialogEventLog, InterstitialConfig, buildPrimaryButton, buildSecondaryButton, buildSheetInfos,
  ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams
} from '../../../main/ets/model/DialogModels';

/**
 * DialogModels 弹窗模型层设备侧测试
 * 覆盖：事件簿记（记录/容量/前缀查询/清空与格式化行）、按钮构造（样式与回调触发）、
 * 单选数据构造（数量/标题/action 携带下标）、插屏配置映射、枚举原始值、参数类默认值
 */
export default function dialogModelsTest() {
  describe('dialogModelsTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0100
     * @tc.name formatOpenCloseClick001
     * @tc.desc Verify open/close/click event lines are formatted for dialog scenes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_openCloseClick', 0, () => {
      expect(DialogEventLog.formatOpen(1, '确认框')).assertEqual('open#1 确认框');
      expect(DialogEventLog.formatClose(8, '插屏')).assertEqual('close#8 插屏');
      expect(DialogEventLog.formatClick(6)).assertEqual('click#6');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0200
     * @tc.name formatSelectCheckError002
     * @tc.desc Verify select/check/error event lines are formatted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_selectCheckError', 0, () => {
      expect(DialogEventLog.formatSelect(3, 2)).assertEqual('select#3 index=2');
      expect(DialogEventLog.formatCheck(1, true)).assertEqual('check#1 checked=true');
      expect(DialogEventLog.formatCheck(1, false)).assertEqual('check#1 checked=false');
      expect(DialogEventLog.formatError(8, '拒绝')).assertEqual('error#8 拒绝');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0300
     * @tc.name recordLastCount003
     * @tc.desc Verify recorded event count and last-line accessor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_lastCount', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('a');
      log.record('b');
      log.record('c');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('c');
      const lines: string[] = log.toLines();
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0400
     * @tc.name recordCapacityLimit004
     * @tc.desc Verify the event log keeps at most 60 entries and drops the oldest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_capacity60', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 1; i <= 65; i++) {
        log.record(`e${i}`);
      }
      // 容量 60：最早的 e1..e5 被丢弃
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual('e6');
      expect(log.last()).assertEqual('e65');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0500
     * @tc.name hasPrefix005
     * @tc.desc Verify prefix-based lookup over recorded events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatOpen(1, '确认框'));
      log.record(DialogEventLog.formatSelect(3, 0));
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('select#3')).assertTrue();
      expect(log.hasPrefix('open#2')).assertFalse();
      expect(log.hasPrefix('close#1')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0600
     * @tc.name clearEmpties006
     * @tc.desc Verify clear resets count, last line and line list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clear_empties', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('x');
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual('');
      expect(log.toLines().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0700
     * @tc.name primaryButtonEmphasized007
     * @tc.desc Verify primary dialog button defaults to EMPHASIZED style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primaryButton_emphasized', 0, () => {
      const btn = buildPrimaryButton('确定');
      expect(btn.content).assertEqual('确定');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0800
     * @tc.name primaryButtonActionFires008
     * @tc.desc Verify primary button invokes its action callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primaryButton_actionFires', 0, () => {
      let fired: boolean = false;
      const btn = buildPrimaryButton('删除', () => {
        fired = true;
      });
      expect(btn.action === undefined).assertFalse();
      btn.action!();
      expect(fired).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_0900
     * @tc.name secondaryButtonTextual009
     * @tc.desc Verify secondary dialog button defaults to TEXTUAL style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('secondaryButton_textual', 0, () => {
      const btn = buildSecondaryButton('取消');
      expect(btn.content).assertEqual('取消');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1000
     * @tc.name sheetInfoCountTitles010
     * @tc.desc Verify SheetInfo list count and titles are built from labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_countTitles', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['A', 'B', 'C'], (index: number) => {
        picked = index;
      });
      expect(sheets.length).assertEqual(3);
      expect(sheets[0].title).assertEqual('A');
      expect(sheets[1].title).assertEqual('B');
      expect(sheets[2].title).assertEqual('C');
      expect(picked).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1100
     * @tc.name sheetInfoActionIndex011
     * @tc.desc Verify each SheetInfo action carries its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_actionCarriesIndex', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['A', 'B', 'C'], (index: number) => {
        picked = index;
      });
      sheets[2].action!();
      expect(picked).assertEqual(2);
      sheets[0].action!();
      expect(picked).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1200
     * @tc.name interstitialConfigMapping012
     * @tc.desc Verify interstitial config maps title, subtitle and positioning enums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitialConfig_mapping', 0, () => {
      const cfg: InterstitialConfig = new InterstitialConfig('标题', '副标题',
        TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
      expect(cfg.title).assertEqual('标题');
      expect(cfg.subtitle).assertEqual('副标题');
      expect(cfg.titlePosition).assertEqual(TitlePosition.BOTTOM);
      expect(cfg.iconStyle).assertEqual(IconStyle.LIGHT);
      expect(cfg.bottomOffsetType).assertEqual(BottomOffset.OFFSET_FOR_NONE);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1300
     * @tc.name dialogEnumValues013
     * @tc.desc Verify IconStyle, TitlePosition and BottomOffset raw enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dialogEnum_values', 0, () => {
      expect(IconStyle.DARK).assertEqual(0);
      expect(IconStyle.LIGHT).assertEqual(1);
      expect(TitlePosition.TOP).assertEqual(0);
      expect(TitlePosition.BOTTOM).assertEqual(1);
      expect(BottomOffset.OFFSET_FOR_BAR).assertEqual(0);
      expect(BottomOffset.OFFSET_FOR_NONE).assertEqual(1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1400
     * @tc.name paramsSceneIds014
     * @tc.desc Verify scene ids and defaults of ComponentContent parameter classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('params_sceneIds', 0, () => {
      expect(new ConfirmParams().sceneId).assertEqual(1);
      expect(new AlertParams().sceneId).assertEqual(2);
      expect(new SelectParams().sceneId).assertEqual(3);
      expect(new TipsParams().sceneId).assertEqual(4);
      expect(new LoadingParams().sceneId).assertEqual(5);
      expect(new CustomParams().sceneId).assertEqual(6);
      expect(new SelectParams().selectedIndex).assertEqual(0);
      expect(new CustomParams().buttons.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1500
     * @tc.name recordCapacityExact60
     * @tc.desc Verify the 60th event is kept and the 61st evicts exactly one oldest entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_capacityExact60', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 1; i <= 60; i++) {
        log.record(`e${i}`);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual('e1');
      expect(log.last()).assertEqual('e60');
      log.record('e61');
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual('e2');
      expect(log.last()).assertEqual('e61');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1600
     * @tc.name toLinesSnapshotIsolated
     * @tc.desc Verify toLines returns a snapshot that is not affected by later records or caller mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toLines_snapshotIsolated', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('a');
      log.record('b');
      const snapshot: string[] = log.toLines();
      log.record('c');
      expect(snapshot.length).assertEqual(2);
      expect(snapshot[1]).assertEqual('b');
      snapshot.push('tamper');
      expect(log.count()).assertEqual(3);
      expect(log.last()).assertEqual('c');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1700
     * @tc.name hasPrefixStartOnly
     * @tc.desc Verify hasPrefix only matches at the start of an event line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix_startOnly', 0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('xopen#1 前缀不在行首');
      expect(log.hasPrefix('open#1')).assertFalse();
      log.record('open#10 第二条确认框');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('open#10')).assertTrue();
      expect(log.hasPrefix('close#1')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1800
     * @tc.name sheetInfosEmptyLabels
     * @tc.desc Verify buildSheetInfos returns an empty list for empty labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_emptyLabels', 0, () => {
      const sheets: SheetInfo[] = buildSheetInfos([], (index: number) => {
      });
      expect(sheets.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_1900
     * @tc.name sheetInfosTitlesSnapshot
     * @tc.desc Verify SheetInfo titles and index closures survive later mutation of the labels array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_titlesSnapshot', 0, () => {
      let picked: number = -1;
      const labels: string[] = ['A', 'B'];
      const sheets: SheetInfo[] = buildSheetInfos(labels, (index: number) => {
        picked = index;
      });
      labels[0] = 'Z';
      labels.push('C');
      expect(sheets.length).assertEqual(2);
      expect(sheets[0].title).assertEqual('A');
      expect(sheets[1].title).assertEqual('B');
      sheets[1].action!();
      expect(picked).assertEqual(1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_2000
     * @tc.name buttonsWithoutAction
     * @tc.desc Verify buttons built without callbacks keep action undefined and their default styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buttons_withoutAction', 0, () => {
      const primary = buildPrimaryButton('主按钮无回调');
      const secondary = buildSecondaryButton('次按钮无回调');
      expect(primary.action === undefined).assertTrue();
      expect(secondary.action === undefined).assertTrue();
      expect(primary.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(secondary.buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
      expect(primary.content).assertEqual('主按钮无回调');
      expect(secondary.content).assertEqual('次按钮无回调');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_2100
     * @tc.name sheetInfosDuplicateLabels
     * @tc.desc Verify duplicate labels still report their own index instead of the first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_duplicateLabels', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['A', 'A', 'B'], (index: number) => {
        picked = index;
      });
      sheets[1].action!();
      expect(picked).assertEqual(1);
      sheets[0].action!();
      expect(picked).assertEqual(0);
      sheets[2].action!();
      expect(picked).assertEqual(2);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELS_2200
     * @tc.name paramsInstancesIsolated
     * @tc.desc Verify parameter instances do not share their mutable buttons array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('params_instancesIsolated', 0, () => {
      const first = new CustomParams();
      const second = new CustomParams();
      first.buttons.push(buildPrimaryButton('x'));
      expect(first.buttons.length).assertEqual(1);
      expect(second.buttons.length).assertEqual(0);
    });
  });
}
