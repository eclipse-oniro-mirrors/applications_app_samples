/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Observed
export class SubtitleStyleModel {
  public visible: boolean = true;
  public sizeIndex: number = 1;
  public colorIndex: number = 0;
  public backgroundIndex: number = 1;
  public positionIndex: number = 0;

  fontSize(): string {
    const sizes: string[] = ['16fp', '18fp', '22fp'];
    return sizes[this.sizeIndex] ?? sizes[1];
  }

  fontColor(): string {
    const colors: string[] = ['#FFFFFF', '#FFEB3B', '#80DEEA'];
    return colors[this.colorIndex] ?? colors[0];
  }

  backgroundColor(): string {
    const colors: string[] = ['#00000000', '#99000000', '#E6000000'];
    return colors[this.backgroundIndex] ?? colors[1];
  }

  reset(): void {
    this.visible = true;
    this.sizeIndex = 1;
    this.colorIndex = 0;
    this.backgroundIndex = 1;
    this.positionIndex = 0;
  }
}
