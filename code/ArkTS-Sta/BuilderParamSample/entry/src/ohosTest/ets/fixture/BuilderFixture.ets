'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Entry, Component, State, Builder, Column, Row, Text, Button, VerticalAlign, $r } from '@kit.ArkUI';
import { Card, CustomCard } from '../../../main/ets/pages/Card';
import { HistoryFixture } from './HistoryFixture';

// This page exists only in the test HAP and always renders production components.
@Entry
@Component
struct BuilderFixture {
  @State mode: string = 'trailing';
  @State detail: string = 'Initial detail';
  @State title: string = 'First card';
  @State description: string = 'First description';
  @State labelClicks: number = 0;
  @State bottomClicks: number = 0;
  @State alignment: VerticalAlign = VerticalAlign.Center;

  reset(mode: string): void {
    this.mode = mode;
    this.detail = 'Initial detail';
    this.title = 'First card';
    this.description = 'First description';
    this.labelClicks = 0;
    this.bottomClicks = 0;
    this.alignment = VerticalAlign.Center;
  }

  @Builder
  detailBuilder() {
    Text(this.detail)
      .id('fixture-detail')
      .height(80)
      .layoutWeight(1)
  }

  @Builder
  labelBuilder() {
    Button('Label')
      .id('fixture-label')
      .height(24)
      .onClick(() => { this.labelClicks++; })
  }

  @Builder
  bottomBuilder() {
    Button('Bottom')
      .id('fixture-bottom')
      .height(28)
      .onClick(() => { this.bottomClicks++; })
  }

  @Builder
  emptyBuilder() {
  }

  build() {
    Column() {
      Row() {
        Text('BuilderParam fixture').id('fixture-heading')
        Button('Histories').id('mode-history').height(24).onClick(() => this.reset('history'))
      }
      Row() {
        Button('Trailing').id('mode-trailing').onClick(() => this.reset('trailing'))
        Button('Explicit').id('mode-explicit').onClick(() => this.reset('explicit'))
        Button('Empty').id('mode-empty').onClick(() => this.reset('empty'))
        Button('Custom').id('mode-custom').onClick(() => this.reset('custom'))
      }
      Text(this.mode).id('fixture-mode')
      if (this.mode === 'history') {
        HistoryFixture()
      } else {
      Row() {
        Button('Update').id('update-detail').onClick(() => {
          this.detail = 'Updated detail';
          this.title = 'Updated card';
          this.description = 'Updated description';
        })
        Button('Top').id('align-top').onClick(() => { this.alignment = VerticalAlign.Top; })
        Button('Bottom').id('align-bottom').onClick(() => { this.alignment = VerticalAlign.Bottom; })
      }
      Row() {
        Button('Clear').id('clear-text').onClick(() => {
          this.title = '';
          this.description = '';
        })
        Button('Unicode').id('unicode-text').onClick(() => {
          this.title = '\u884c\u7a0b \u2708 2026';
          this.description = 'Line one\nLine two';
        })
        Button('App resource probe').id('mode-app-resource').onClick(() => this.reset('app-resource'))
      }
      Text('Label clicks: ' + this.labelClicks).id('label-clicks')
      Text('Bottom clicks: ' + this.bottomClicks).id('bottom-clicks')
      if (this.mode === 'explicit') {
        Card({ testId: 'fixture-card',
          bottomContent: this.bottomBuilder, detailContent: this.detailBuilder, labelContent: this.labelBuilder })
          .width('90%')
      } else if (this.mode === 'empty') {
        Card({ testId: 'fixture-card', verticalAlign: this.alignment,
          bottomContent: this.emptyBuilder, detailContent: this.detailBuilder }) {
          this.labelBuilder()
        }.width('90%')
      } else if (this.mode === 'custom') {
        Text($r('sys.string.general_copy')).id('fixture-resource-reference')
        CustomCard({ testId: 'custom-first', title: this.title, description: this.description }).width('100%')
        CustomCard({ testId: 'custom-second', title: 'Second card', description: 'Second description' }).width('100%')
        CustomCard({ testId: 'custom-resource', title: 'Resource card',
          description: $r('sys.string.general_copy') })
          .width('100%')
      } else if (this.mode === 'app-resource') {
        // Preserve the failing app-resource path separately from supported system resources.
        Text('Description from test resources').id('probe-app-expected')
        Text($r('app.string.fixture_card_description')).id('probe-app-direct')
        CustomCard({ testId: 'probe-app-card', title: 'App resource probe',
          description: $r('app.string.fixture_card_description') })
          .width('100%')
      } else {
        Card({ testId: 'fixture-card', verticalAlign: this.alignment,
          bottomContent: this.bottomBuilder, detailContent: this.detailBuilder }) {
          this.labelBuilder()
        }.width('90%')
      }
      }
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor('#eeeeee')
  }
}
