import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../common/Theme';
import { PAGE_LOG_LIMIT } from '../common/AppConstants';
import { LogItem, LogLevel, queryLogs } from '../model/LogStore';
import { Logger } from '../utils/Logger';
import { truncateMiddle } from '../utils/FormatUtil';

@Component
export struct LogPanel {
  @StorageProp('appLogs') allLogs: LogItem[] = [];
  filterSource: string = '';
  title: string = '事件日志';
  maxItems: number = PAGE_LOG_LIMIT;

  private visibleLogs(): LogItem[] {
    return queryLogs(this.allLogs, this.filterSource, LogLevel.DEBUG, '', this.maxItems);
  }

  private tagBackground(item: LogItem): string {
    if (item.level === LogLevel.ERROR) {
      return AppColors.DANGER_SOFT;
    }
    if (item.level === LogLevel.WARN) {
      return AppColors.WARNING_SOFT;
    }
    return AppColors.PRIMARY_SOFT;
  }

  private tagColor(item: LogItem): string {
    if (item.level === LogLevel.ERROR) {
      return AppColors.DANGER;
    }
    if (item.level === LogLevel.WARN) {
      return AppColors.WARNING;
    }
    return AppColors.PRIMARY;
  }

  private displayDetail(item: LogItem): string {
    return truncateMiddle(item.detail, 160);
  }

  build() {
    Column({ space: AppSpacing.MD }) {
      Row({ space: AppSpacing.MD }) {
        Text(this.title)
          .fontSize(AppText.SECTION)
          .fontWeight(FontWeight.Medium)
          .fontColor(AppColors.TEXT_PRIMARY)
        Blank()
        Text(`${this.visibleLogs().length} 条`)
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_TERTIARY)
        if (this.visibleLogs().length > 0) {
          Button('清空')
            .fontSize(AppText.SMALL)
            .height(AppSize.BUTTON_SM)
            .backgroundColor(AppColors.SOFT_BG)
            .fontColor(AppColors.TEXT_STRONG)
            .onClick(() => {
              AlertDialog.show({
                title: '清空日志',
                message: '将清空全部事件记录，且不可恢复，确认继续？',
                autoCancel: true,
                alignment: DialogAlignment.Center,
                primaryButton: {
                  value: '取消',
                  action: () => {
                  }
                },
                secondaryButton: {
                  value: '清空',
                  fontColor: AppColors.DANGER,
                  action: () => {
                    Logger.clear();
                  }
                }
              });
            })
        }
      }
      .width('100%')

      if (this.visibleLogs().length === 0) {
        Text('暂无事件，操作组件后将在这里看到回调记录')
          .fontSize(AppText.BODY)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
          .padding({ top: AppSpacing.SM, bottom: AppSpacing.SM })
      } else {
        ForEach(this.visibleLogs(), (item: LogItem) => {
          Row({ space: AppSpacing.MD }) {
            Text(item.time)
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_TERTIARY)
              .fontFamily('monospace')
            Text(`${item.source}·${item.tag}`)
              .fontSize(AppText.SMALL)
              .fontColor(this.tagColor(item))
              .backgroundColor(this.tagBackground(item))
              .borderRadius(AppRadius.TAG)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
            Text(this.displayDetail(item))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_STRONG)
              .layoutWeight(1)
          }
          .width('100%')
          .alignItems(VerticalAlign.Top)
        }, (item: LogItem) => item.id.toString())
      }
    }
    .width('100%')
    .padding(AppSpacing.XL)
    .backgroundColor(AppColors.CARD_BG)
    .borderRadius(AppRadius.LARGE)
  }
}
