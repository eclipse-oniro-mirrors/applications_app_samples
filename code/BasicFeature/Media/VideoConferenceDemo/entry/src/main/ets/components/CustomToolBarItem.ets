interface ToolBarItemType {
  id: string;
  label: string;
  iconActive: Resource;
  iconInactive?: Resource;
  iconActiveColors: ResourceColor[];
  iconInActiveColors: ResourceColor[];
  isActive: boolean;
  onClick?: (isActive: boolean) => void;
}

@Observed
export class ToolBarItem {
  @Track public id: string;
  @Track public label: string;
  @Track public iconActive: Resource;
  @Track public iconInactive?: Resource;
  @Track public iconActiveColors?: ResourceColor[];
  @Track public iconInActiveColors?: ResourceColor[];
  @Track public isActive: boolean;
  public onClick: (isActive: boolean) => void;

  constructor(item: ToolBarItemType) {
    this.id = item.id;
    this.label = item.label;
    this.iconActive = item.iconActive;
    this.iconInactive = item.iconInactive;
    this.iconActiveColors = item.iconActiveColors;
    this.iconInActiveColors = item.iconInActiveColors;
    this.isActive = item.isActive ?? false;
    this.onClick = item.onClick ?? ((isActive: boolean = false) => {
    });
  }
}

@Component
export struct CustomToolBarItem {
  @ObjectLink toolBarItem: ToolBarItem;

  build() {
    Column() {
      Row() {
        SymbolGlyph(this.toolBarItem.iconInactive && !this.toolBarItem.isActive ?
          this.toolBarItem.iconInactive :
          this.toolBarItem.iconActive)
          .fontSize(24)
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
          .fontColor(
            this.toolBarItem.isActive ?
              this.toolBarItem.iconActiveColors :
              this.toolBarItem.iconInActiveColors
          )
      }
      .width(24)
      .height(24)
      .margin({ bottom: 4 })

      Text(this.toolBarItem.label)
        .fontColor(Color.White)
        .fontSize(10)
    }
    .layoutWeight(1)
    .height('100%')
    .padding(8)
    .onClick(() => {
      this.toolBarItem.isActive = !this.toolBarItem.isActive;
      this.toolBarItem.onClick(this.toolBarItem.isActive);
    })
  }
}