'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
import { TabInfo } from '../../../main/ets/model/TabInfo';
import { $r, Resource } from '@ohos.arkui.component';

// Keep ResourceStr declarations inside the static runtime, while exercising the real model.
export class TabInfoFixture {
  private tab: TabInfo;
  constructor(id: number, title: string, selectedIcon: string, defaultIcon: string) {
    this.tab = new TabInfo(id, title, selectedIcon, defaultIcon);
  }
  get id(): number { return this.tab.id; }
  set id(value: number) { this.tab.id = value; }
  get title(): string { return this.tab.title as string; }
  set title(value: string) { this.tab.title = value; }
  get selectedIcon(): string { return this.tab.selectedIcon as string; }
  set selectedIcon(value: string) { this.tab.selectedIcon = value; }
  get defaultIcon(): string { return this.tab.defaultIcon as string; }
  set defaultIcon(value: string) { this.tab.defaultIcon = value; }
}

export class TabResourceFixture {
  private titleResource: Resource = $r('app.string.background_blur_main');
  private selectedResource: Resource = $r('app.media.backgroundblur_main_select');
  private defaultResource: Resource = $r('app.media.backgroundblur_main_normal');
  private tab: TabInfo;

  constructor() {
    this.tab = new TabInfo(0, this.titleResource, this.selectedResource, this.defaultResource);
  }

  get id(): number { return this.tab.id; }
  get titleKeepsResource(): boolean { return this.tab.title === this.titleResource; }
  get selectedKeepsResource(): boolean { return this.tab.selectedIcon === this.selectedResource; }
  get defaultKeepsResource(): boolean { return this.tab.defaultIcon === this.defaultResource; }
  get iconResourcesAreDistinct(): boolean { return this.selectedResource.id !== this.defaultResource.id; }
  get literalTitle(): string { return this.tab.title as string; }
  get literalSelectedIcon(): string { return this.tab.selectedIcon as string; }
  get literalDefaultIcon(): string { return this.tab.defaultIcon as string; }

  setLiteralTitle(value: string): void {
    this.tab.title = value;
  }

  restoreResourceTitle(): void {
    this.tab.title = this.titleResource;
  }

  setLiteralSelectedIcon(value: string): void {
    this.tab.selectedIcon = value;
  }

  setLiteralDefaultIcon(value: string): void {
    this.tab.defaultIcon = value;
  }

  restoreSelectedResource(): void {
    this.tab.selectedIcon = this.selectedResource;
  }

  restoreDefaultResource(): void {
    this.tab.defaultIcon = this.defaultResource;
  }
}
