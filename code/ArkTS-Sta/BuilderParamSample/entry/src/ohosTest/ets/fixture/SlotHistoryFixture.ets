'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { Component, State, Builder, Column, Row, Text, Button, VerticalAlign } from '@kit.ArkUI';
import { Card } from '../../../main/ets/pages/Card';

@Component
export struct SlotHistoryFixture {
  @State labelVisible: boolean = true;
  @State detailVisible: boolean = true;
  @State bottomVisible: boolean = true;
  @State extraBottom: boolean = false;
  @State detailKind: string = 'text';
  @State tallDetail: boolean = false;
  @State tallLabel: boolean = false;
  @State narrow: boolean = false;
  @State alignment: VerticalAlign = VerticalAlign.Center;
  @State alignmentName: string = 'Center';
  @State labelCount: number = 0;
  @State bottomCount: number = 0;
  @State detailCount: number = 0;
  @State innerCount: number = 0;

  reset(): void {
    this.labelVisible = true;
    this.detailVisible = true;
    this.bottomVisible = true;
    this.extraBottom = false;
    this.detailKind = 'text';
    this.tallDetail = false;
    this.tallLabel = false;
    this.narrow = false;
    this.alignment = VerticalAlign.Center;
    this.alignmentName = 'Center';
    this.labelCount = 0;
    this.bottomCount = 0;
    this.detailCount = 0;
    this.innerCount = 0;
  }

  cycleAlignment(): void {
    if (this.alignment === VerticalAlign.Center) {
      this.alignment = VerticalAlign.Top;
      this.alignmentName = 'Top';
    } else if (this.alignment === VerticalAlign.Top) {
      this.alignment = VerticalAlign.Bottom;
      this.alignmentName = 'Bottom';
    } else {
      this.alignment = VerticalAlign.Center;
      this.alignmentName = 'Center';
    }
  }

  @Builder
  labelBuilder(): void {
    if (this.labelVisible) {
      Button('Label')
        .id('slots-label')
        .height(this.tallLabel ? 96 : 24)
        .onClick(() => { this.labelCount++; })
    }
  }

  @Builder
  innerLabelBuilder(): void {
    Button('Inner')
      .id('slots-inner-label')
      .height(24)
      .onClick(() => { this.innerCount++; })
  }

  @Builder
  innerDetailBuilder(): void {
    Text('Inner detail')
      .id('slots-inner-detail')
      .height(48)
      .layoutWeight(1)
  }

  @Builder
  innerBottomBuilder(): void {
    Text('Inner footer')
      .id('slots-inner-bottom')
      .height(20)
  }

  @Builder
  detailBuilder(): void {
    if (this.detailVisible) {
      if (this.detailKind === 'button') {
        Button('Detail action')
          .id('slots-detail-button')
          .height(this.tallDetail ? 88 : 40)
          .layoutWeight(1)
          .onClick(() => { this.detailCount++; })
      } else if (this.detailKind === 'nested') {
        Card({
          testId: 'slots-inner',
          bottomContent: this.innerBottomBuilder,
          detailContent: this.innerDetailBuilder,
          labelContent: this.innerLabelBuilder
        })
          .layoutWeight(1)
      } else {
        Text('Detail text')
          .id('slots-detail-text')
          .height(this.tallDetail ? 88 : 40)
          .layoutWeight(1)
      }
    }
  }

  @Builder
  bottomBuilder(): void {
    if (this.bottomVisible) {
      Button('Footer action')
        .id('slots-bottom')
        .height(28)
        .onClick(() => { this.bottomCount++; })
      if (this.extraBottom) {
        Text('Second footer root')
          .id('slots-bottom-extra')
          .height(20)
      }
    }
  }

  build(): void {
    Column() {
      Row() {
        Button('Reset').id('slots-reset').onClick(() => this.reset())
        Button('Label').id('slots-toggle-label').onClick(() => { this.labelVisible = !this.labelVisible; })
        Button('Detail').id('slots-toggle-detail').onClick(() => { this.detailVisible = !this.detailVisible; })
        Button('Footer').id('slots-toggle-bottom').onClick(() => { this.bottomVisible = !this.bottomVisible; })
      }
      Row() {
        Button('Text').id('slots-use-text').onClick(() => { this.detailKind = 'text'; })
        Button('Action').id('slots-use-button').onClick(() => { this.detailKind = 'button'; })
        Button('Nested').id('slots-use-nested').onClick(() => { this.detailKind = 'nested'; })
        Button('Extra').id('slots-toggle-extra').onClick(() => { this.extraBottom = !this.extraBottom; })
      }
      Row() {
        Button('Height').id('slots-grow-detail').onClick(() => { this.tallDetail = !this.tallDetail; })
        Button('Label H').id('slots-grow-label').onClick(() => { this.tallLabel = !this.tallLabel; })
        Button('Width').id('slots-toggle-width').onClick(() => { this.narrow = !this.narrow; })
        Button('Align').id('slots-align').onClick(() => this.cycleAlignment())
      }
      Text(this.alignmentName).id('slots-alignment')
      Text('Label ' + this.labelCount + '; footer ' + this.bottomCount +
        '; detail ' + this.detailCount + '; inner ' + this.innerCount).id('slots-counts')
      Card({
        testId: 'slots-card',
        verticalAlign: this.alignment,
        bottomContent: this.bottomBuilder,
        detailContent: this.detailBuilder
      }) {
        this.labelBuilder()
      }
        .width(this.narrow ? '64%' : '100%')
    }
    .id('slots-surface')
    .width('100%')
  }
}
