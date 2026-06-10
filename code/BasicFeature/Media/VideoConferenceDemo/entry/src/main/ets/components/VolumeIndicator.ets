@Component
struct VolumeIndicator {
  @State volumePercent: number = 0.5;

  aboutToAppear(): void {
    // 监听输入音量变化
  }

  aboutToDisappear(): void {
    // 取消监听
  }

  build() {
    Progress({
      value: this.volumePercent,
      total: 1,
      type: ProgressType.Capsule
    })
      .value(this.volumePercent)
      .width(7.2)
      .height(13.5)
      .rotate({ angle: 180 })
      .color('#6ECE7F')
  }
}

@Builder
export function VolumeIndicatorBuilder(shouldShow: boolean) {
  if (shouldShow) {
    VolumeIndicator();
  }
}