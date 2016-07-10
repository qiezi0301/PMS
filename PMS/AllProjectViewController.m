//
//  AllProjectViewController.m
//  PMS
//
//  Created by Mac on 16/7/10.
//  Copyright © 2016年 itjz. All rights reserved.
//

#import "AllProjectViewController.h"

@interface AllProjectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation AllProjectViewController


-(NSMutableArray*)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        
        BmobQuery   *bquery = [BmobQuery queryWithClassName:kProjectTable];
        //查找GameScore表的数据
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            for (BmobObject *obj in array) {
                //打印playerName
                NSLog(@"obj.playerName = %@", [obj objectForKey:KProjectName]);
                //打印objectId,createdAt,updatedAt
                NSLog(@"obj.objectId = %@", [obj objectId]);
                NSLog(@"obj.createdAt = %@", [obj createdAt]);
                NSLog(@"obj.updatedAt = %@", [obj updatedAt]);
                [_dataArray addObject:[obj objectForKey:KProjectName]];
                
                //执行tabelView代码，否者没反应
                [self.tableView reloadData];
            }
        }];
        
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self loadUserFriends];
}


- (IBAction)addPJAction:(id)sender {
    [self performSegueWithIdentifier:@"toAddPJVC" sender:nil];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"self.dataArray.count= %lu", (unsigned long)self.dataArray.count);
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //获取数据
    NSString *nameString = self.dataArray[indexPath.row];
    NSLog(@"nameString= %@", nameString);

    //设置内容
    cell.textLabel.text = nameString;
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    BmobIMUserInfo *info = self.userArray[indexPath.row];
//    
//    BmobIMConversation *conversation = [BmobIMConversation conversationWithId:info.userId conversationType:BmobIMConversationTypeSingle];
//    conversation.conversationTitle =  info.name;
//    [self performSegueWithIdentifier:@"toChatVC" sender:conversation];
    [self performSegueWithIdentifier:@"toPJTKVC" sender:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
