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
  display,
  ExtraRegionPosition,
  FoldSplitContainer,
  HoverModeStatus,
  PresetSplitRatio,
  router
} from '@kit.ArkUI';
import Logger from '../util/Logger';
import { DeviceUtils } from '../utils/DeviceUtils';
import { FoldConfigUtils } from '../utils/FoldConfigUtils';
import { BreakpointUtils } from '../utils/BreakpointUtils';

/** FoldSplit sample page. */
@Entry
@Component
struct FoldSplitDemo {
  @State widthVp: number = 0;
  private lastBreakpoint: string = '';
  @State foldable: boolean = false;
  @State foldStatus: string = 'unknown';
  @State hoverStatus: string = 'none';
  @State simulationMode: string = 'folded';
  @State splitRatio: number = PresetSplitRatio.LAYOUT_3V2;
  @State ratioName: string = '3V2';
  @State extraPosition: number = ExtraRegionPosition.TOP;
  @State positionName: string = 'TOP';
  @State animationEnabled: boolean = false;
  @State perpendicular: boolean = false;
  @State showExtraRegion: boolean = true;
  @State extraEnabled: boolean = true;
  @State foldedRatio: number = PresetSplitRatio.LAYOUT_1V1;
  @State foldedRatioName: string = '1V1';
  @State hoverDetail: string = 'none';

  private foldCallback: Callback<display.FoldStatus> = (status: display.FoldStatus) => {
    this.foldStatus = DeviceUtils.foldStatusName(status);
    Logger.info(`foldStatusChange: ${this.foldStatus}`);
  };

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('FoldSplitDemo');
    this.foldable = DeviceUtils.isFoldable();
    this.foldStatus = DeviceUtils.foldStatusName(DeviceUtils.foldStatus());
    DeviceUtils.registerFoldListener(this.foldCallback);
    Logger.info(`FoldSplitDemo aboutToAppear, foldable=${this.foldable}, status=${this.foldStatus}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    DeviceUtils.unregisterFoldListener(this.foldCallback);
    Logger.leave('FoldSplitDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('FoldSplitDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('FoldSplitDemo');
  }

  @Builder
  PrimaryRegion() {
    Text($r('app.string.split_primary'))
      .fontSize(16)
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#FFE0E0')
  }

  @Builder
  SecondaryRegion() {
    Text($r('app.string.split_secondary'))
      .fontSize(16)
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#E0FFE0')
  }

  @Builder
  ExtraRegion() {
    Text($r('app.string.split_extra'))
      .fontSize(16)
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#E0E0FF')
  }

  @Builder
  SimulatedPreview() {
    if (this.simulationMode === 'folded') {
      Column() {
        Column() { this.PrimaryRegion() }.layoutWeight(2)
        Column() { this.SecondaryRegion() }.layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    } else if (this.simulationMode === 'hover') {
      Row() {
        Column() { this.PrimaryRegion() }.layoutWeight(2)
        Column() {
          Column() { this.SecondaryRegion() }.layoutWeight(1)
          Column() { this.ExtraRegion() }.layoutWeight(1)
        }
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    } else {
      Row() {
        Column() { this.PrimaryRegion() }.layoutWeight(3)
        Column() {
          Column() { this.SecondaryRegion() }.layoutWeight(1)
          Column() { this.ExtraRegion() }.layoutWeight(1)
        }
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 6 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('foldBack')
          .onClick(() => {
            Logger.info('back to index from FoldSplitDemo');
            router.back();
          })
        Text($r('app.string.fold_title'))
          .id('foldTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 12 })

      Text(`foldable=${this.foldable}, foldStatus=${this.foldStatus}, hover=${this.hoverStatus}`)
        .id('foldStatusText')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Row({ space: 6 }) {
        Button('1V1').id('ratio1v1').onClick(() => {
          this.splitRatio = PresetSplitRatio.LAYOUT_1V1;
          this.ratioName = '1V1';
          Logger.info('splitRatio=1V1');
        })
        Button('2V3').id('ratio2v3').onClick(() => {
          this.splitRatio = PresetSplitRatio.LAYOUT_2V3;
          this.ratioName = '2V3';
          Logger.info('splitRatio=2V3');
        })
        Button('3V2').id('ratio3v2').onClick(() => {
          this.splitRatio = PresetSplitRatio.LAYOUT_3V2;
          this.ratioName = '3V2';
          Logger.info('splitRatio=3V2');
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Row({ space: 6 }) {
        Button('Top').id('posTop').onClick(() => {
          this.extraPosition = ExtraRegionPosition.TOP;
          this.positionName = 'TOP';
          Logger.info('extraRegionPosition=TOP');
        })
        Button('Bottom').id('posBottom').onClick(() => {
          this.extraPosition = ExtraRegionPosition.BOTTOM;
          this.positionName = 'BOTTOM';
          Logger.info('extraRegionPosition=BOTTOM');
        })
        Button(this.animationEnabled ? 'Animation on' : 'Animation off')
          .id('animToggle')
          .onClick(() => {
            this.animationEnabled = !this.animationEnabled;
            Logger.info(`animationEnabled=${this.animationEnabled}`);
          })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Row({ space: 6 }) {
        Button('Perp').id('expPerp').onClick(() => {
          this.perpendicular = !this.perpendicular;
          Logger.info(`isExtraRegionPerpendicular=${this.perpendicular}`);
        })
        Button('HoverExtra').id('hoverExtraToggle').onClick(() => {
          this.showExtraRegion = !this.showExtraRegion;
          Logger.info(`showExtraRegion=${this.showExtraRegion}`);
        })
        Button('2V3').id('foldedRatio2v3').onClick(() => {
          this.foldedRatio = PresetSplitRatio.LAYOUT_2V3;
          this.foldedRatioName = '2V3';
          Logger.info('foldedRatio=2V3');
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Text(FoldConfigUtils.summary(FoldConfigUtils.ratioName(this.splitRatio),
        FoldConfigUtils.positionName(this.extraPosition), this.animationEnabled, this.perpendicular,
        this.showExtraRegion, this.foldedRatioName, this.extraEnabled))
        .id('foldConfigText')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Text(this.hoverDetail)
        .id('foldHoverDetail')
        .fontSize(11)
        .fontColor('#999999')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Column() {
        FoldSplitContainer({
          primary: () => {
            this.PrimaryRegion()
          },
          secondary: () => {
            this.SecondaryRegion()
          },
          extra: () => {
            this.ExtraRegion()
          },
          expandedLayoutOptions: {
            horizontalSplitRatio: this.splitRatio,
            verticalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
            extraRegionPosition: this.extraPosition,
            isExtraRegionPerpendicular: this.perpendicular
          },
          hoverModeLayoutOptions: {
            horizontalSplitRatio: this.splitRatio,
            extraRegionPosition: this.extraPosition,
            showExtraRegion: this.showExtraRegion
          },
          foldedLayoutOptions: {
            verticalSplitRatio: this.foldedRatio
          },
          animationOptions: this.animationEnabled ? { duration: 300 } : null,
          onHoverStatusChange: (status: HoverModeStatus) => {
            this.hoverStatus = DeviceUtils.foldStatusName(status.foldStatus);
            this.hoverDetail = `hover=${status.isHoverMode}, rotation=${status.appRotation}, window=${status.windowStatusType}`;
            Logger.info(`onHoverStatusChange: ${this.hoverStatus}, ${this.hoverDetail}`);
          }
        })
      }
      .id('foldRealContainer')
      .height(240)
      .width('100%')
      .padding({ left: 12, right: 12 })

      Row({ space: 8 }) {
        Text($r('app.string.sim_preview'))
          .fontSize(13)
        Button($r('app.string.sim_folded')).id('simFolded').onClick(() => {
          this.simulationMode = 'folded';
          Logger.info(`simulate folded, width=${BreakpointUtils.describe(this.widthVp)}`);
        })
        Button($r('app.string.sim_hover')).id('simHover').onClick(() => {
          this.simulationMode = 'hover';
          Logger.info(`simulate hover, width=${BreakpointUtils.describe(this.widthVp)}`);
        })
        Button($r('app.string.sim_expanded')).id('simExpanded').onClick(() => {
          this.simulationMode = 'expanded';
          Logger.info(`simulate expanded, width=${BreakpointUtils.describe(this.widthVp)}`);
        })
        Text(this.simulationMode)
          .id('simModeText')
          .fontSize(13)
      }
      .width('100%')
      .padding({ left: 12, right: 12 })

      Column() {
        this.SimulatedPreview()
      }
      .id('simPreview')
      .height(220)
      .width('100%')
      .margin({ left: 12, right: 12, bottom: 12 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
      const nextBreakpoint = BreakpointUtils.resolve(this.widthVp);
      if (nextBreakpoint !== this.lastBreakpoint) {
        this.lastBreakpoint = nextBreakpoint;
        Logger.event('FoldSplitDemo', 'breakpointChanged', BreakpointUtils.describe(this.widthVp));
      }
    })
  }
}
