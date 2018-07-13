class startBox_Dialog
{
    idd = 9999;
    movingEnabled = false;

    class controls
    {
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by Hilltop, v1.063, #Hofuqe)
    ////////////////////////////////////////////////////////

        class startBox_rscPicture: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h =  0.385 * safezoneH;
        };

        class startBox_buildList: RscListbox
        {
            idc = 1500;
            x = 0.21 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.143 * safezoneW;
            h = 0.3 * safezoneH;
        };
        class startBox_buildButton: RscButton
        {
            idc = 1600;
            text = "Purchase Building";
            x = 0.21 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.143 * safezoneW;
            h = 0.04 * safezoneH;
            action = "_nil=[]ExecVM ""bulwark\purchase.sqf""";
        };

        class startBox_supportLst: RscListbox
        {
            idc = 1501;
            x = 0.505 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.143 * safezoneW;
            h = 0.3 * safezoneH;
        };
        class startBox_supportButton: RscButton
        {
            idc = 1601;
            text = "Purchase Support";
            x = 0.505 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.143 * safezoneW;
            h = 0.04 * safezoneH;
            action = "_nil=[]ExecVM ""supports\purchase.sqf""";
        };

        class startBox_manLst: RscListbox
        {
            idc = 1502;
            x = 0.355 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.142 * safezoneW;
            h = 0.3 * safezoneH;
        };
        class startBox_manButton: RscButton
        {
            idc = 1602;
            text = "Purchase Man";
            x = 0.355 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.142 * safezoneW;
            h = 0.04 * safezoneH;
            action = "_nil=[]ExecVM ""supports\purchaseMan.sqf""";
        };


        class startBox_vehicleLst: RscListbox
        {
            idc = 1503;
            x = 0.655 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.142 * safezoneW;
            h = 0.3 * safezoneH;
        };
        class startBox_vehicleButton: RscButton
        {
            idc = 1603;
            text = "Purchase Support";
            x = 0.655 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.142 * safezoneW;
            h = 0.04 * safezoneH;
            action = "_nil=[]ExecVM ""supports\purchaseVehi.sqf""";
        };

        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////

  };
};
