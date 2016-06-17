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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_rot_combintorial.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_0926123340_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 4648);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3776);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 4648);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3776);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0926123340_2372691052_p_1(char *t0)
{
    char t10[16];
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    int64 t8;
    int64 t9;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    int t23;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 8024);
    *((int *)t2) = 0;
    t3 = (t0 + 8028);
    *((int *)t3) = 40;
    t4 = 0;
    t5 = 40;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(96, ng0);
    t6 = (t0 + 2608U);
    t7 = *((char **)t6);
    t8 = *((int64 *)t7);
    t9 = (5 * t8);
    t6 = (t0 + 4024);
    xsi_process_wait(t6, t9);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB6:    t2 = (t0 + 8024);
    t4 = *((int *)t2);
    t3 = (t0 + 8028);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB19:    t14 = (t4 + 1);
    t4 = t14;
    t6 = (t0 + 8024);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 7672U);
    t6 = (t0 + 8032);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 31;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (31 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t10, t3, t2, t6, t11);
    t16 = (t0 + 4712);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t13, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2608U);
    t3 = *((char **)t2);
    t8 = *((int64 *)t3);
    t9 = (5 * t8);
    t2 = (t0 + 4024);
    xsi_process_wait(t2, t9);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t21 = *((unsigned char *)t3);
    t22 = (t21 == (unsigned char)0);
    if (t22 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(109, ng0);

LAB17:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4840);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB6;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4024);
    t6 = (t0 + 3320U);
    t7 = (t0 + 1032U);
    t12 = *((char **)t7);
    t7 = (t0 + 7624U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t12, t7);
    std_textio_write6(STD_TEXTIO, t2, t6, ((double)(t14)), (unsigned char)0, 16, 0);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4024);
    t3 = (t0 + 2936U);
    t6 = (t0 + 3320U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4024);
    t3 = (t0 + 3320U);
    t6 = (t0 + 1192U);
    t7 = *((char **)t6);
    t6 = (t0 + 7640U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t14)), (unsigned char)0, 20, 0);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 4024);
    t3 = (t0 + 3040U);
    t6 = (t0 + 3320U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4024);
    t3 = (t0 + 3320U);
    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t6 = (t0 + 7656U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t14)), (unsigned char)0, 20, 0);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 4024);
    t3 = (t0 + 3144U);
    t6 = (t0 + 3320U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t14 = *((int *)t3);
    t23 = (t14 + 1);
    t2 = (t0 + 4776);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = t23;
    xsi_driver_first_trans_fast(t2);
    goto LAB17;

}


extern void work_a_0926123340_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0926123340_2372691052_p_0,(void *)work_a_0926123340_2372691052_p_1};
	xsi_register_didat("work_a_0926123340_2372691052", "isim/tb_rot_combintorial_isim_beh.exe.sim/work/a_0926123340_2372691052.didat");
	xsi_register_executes(pe);
}
