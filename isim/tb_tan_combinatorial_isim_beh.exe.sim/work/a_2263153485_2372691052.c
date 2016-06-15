/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_tan_combinatorial.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_2263153485_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4360);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 5496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4360);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2263153485_2372691052_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(101, ng0);

LAB3:    t1 = (1 * 1000LL);
    t2 = (t0 + 5560);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 3088U);
    t8 = *((char **)t7);
    t9 = *((int64 *)t8);
    t7 = (t0 + 5560);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t7, 0U, 1, t9);
    t14 = (t0 + 5560);
    xsi_driver_intertial_reject(t14, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2263153485_2372691052_p_2(char *t0)
{
    char t16[16];
    char t17[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t18;
    char *t19;
    int64 t20;
    int64 t21;
    unsigned char t22;
    int t23;

LAB0:    t1 = (t0 + 5048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 9616);
    *((int *)t2) = 0;
    t3 = (t0 + 9620);
    *((int *)t3) = 300;
    t4 = 0;
    t5 = 300;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(115, ng0);
    t6 = (t0 + 9616);
    t7 = *((int *)t6);
    t8 = (t7 > 150);
    if (t8 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 9176U);
    t6 = (t0 + 9688);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 31;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t7 = (31 - 0);
    t18 = (t7 * 1);
    t18 = (t18 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t18;
    t11 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t16, t3, t2, t6, t17);
    t12 = (t0 + 5624);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 9192U);
    t6 = (t0 + 9720);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 31;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t7 = (31 - 0);
    t18 = (t7 * 1);
    t18 = (t18 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t18;
    t11 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t16, t3, t2, t6, t17);
    t12 = (t0 + 5688);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);

LAB9:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (10 * t20);
    t2 = (t0 + 4856);
    xsi_process_wait(t2, t21);

LAB13:    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB6:    t2 = (t0 + 9616);
    t4 = *((int *)t2);
    t3 = (t0 + 9620);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB18:    t7 = (t4 + 1);
    t4 = t7;
    t6 = (t0 + 9616);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(116, ng0);
    t9 = (t0 + 9624);
    t11 = (t0 + 5624);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 9192U);
    t6 = (t0 + 9656);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 31;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t7 = (31 - 0);
    t18 = (t7 * 1);
    t18 = (t18 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t18;
    t11 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t16, t3, t2, t6, t17);
    t12 = (t0 + 5688);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t22 = (t8 == (unsigned char)0);
    if (t22 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(136, ng0);

LAB16:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5816);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 5880);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB6;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4856);
    t6 = (t0 + 3904U);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 9112U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t9);
    std_textio_write6(STD_TEXTIO, t2, t6, ((double)(t7)), (unsigned char)0, 16, 0);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3416U);
    t6 = (t0 + 3904U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3904U);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 9128U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 16, 0);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3520U);
    t6 = (t0 + 3904U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3904U);
    t6 = (t0 + 1832U);
    t9 = *((char **)t6);
    t6 = (t0 + 9160U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 20, 0);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3624U);
    t6 = (t0 + 3904U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3904U);
    t6 = (t0 + 1672U);
    t9 = *((char **)t6);
    t6 = (t0 + 9144U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 20, 0);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 4856);
    t3 = (t0 + 3728U);
    t6 = (t0 + 3904U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t7 = *((int *)t3);
    t23 = (t7 + 1);
    t2 = (t0 + 5752);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t23;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

}


extern void work_a_2263153485_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2263153485_2372691052_p_0,(void *)work_a_2263153485_2372691052_p_1,(void *)work_a_2263153485_2372691052_p_2};
	xsi_register_didat("work_a_2263153485_2372691052", "isim/tb_tan_combinatorial_isim_beh.exe.sim/work/a_2263153485_2372691052.didat");
	xsi_register_executes(pe);
}
