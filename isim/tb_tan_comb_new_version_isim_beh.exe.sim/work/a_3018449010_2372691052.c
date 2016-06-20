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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_tan_comb_new_version.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_3018449010_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 5088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4200);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 5088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4200);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3018449010_2372691052_p_1(char *t0)
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

LAB0:    t1 = (t0 + 4640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 9056);
    *((int *)t2) = 0;
    t3 = (t0 + 9060);
    *((int *)t3) = 300;
    t4 = 0;
    t5 = 300;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(111, ng0);
    t6 = (t0 + 9056);
    t7 = *((int *)t6);
    t8 = (t7 > 150);
    if (t8 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 8616U);
    t6 = (t0 + 9128);
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
    t12 = (t0 + 5152);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 8632U);
    t6 = (t0 + 9160);
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
    t12 = (t0 + 5216);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);

LAB9:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (10 * t20);
    t2 = (t0 + 4448);
    xsi_process_wait(t2, t21);

LAB13:    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB6:    t2 = (t0 + 9056);
    t4 = *((int *)t2);
    t3 = (t0 + 9060);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB18:    t7 = (t4 + 1);
    t4 = t7;
    t6 = (t0 + 9056);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(112, ng0);
    t9 = (t0 + 9064);
    t11 = (t0 + 5152);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 32U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 8632U);
    t6 = (t0 + 9096);
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
    t12 = (t0 + 5216);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t19 = *((char **)t15);
    memcpy(t19, t11, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t22 = (t8 == (unsigned char)0);
    if (t22 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(132, ng0);

LAB16:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5344);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 5408);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB6;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 4448);
    t6 = (t0 + 3744U);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 8552U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t9);
    std_textio_write6(STD_TEXTIO, t2, t6, ((double)(t7)), (unsigned char)0, 16, 0);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3256U);
    t6 = (t0 + 3744U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3744U);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 8568U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 16, 0);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3360U);
    t6 = (t0 + 3744U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3744U);
    t6 = (t0 + 1672U);
    t9 = *((char **)t6);
    t6 = (t0 + 8600U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 20, 0);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3464U);
    t6 = (t0 + 3744U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3744U);
    t6 = (t0 + 1512U);
    t9 = *((char **)t6);
    t6 = (t0 + 8584U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t7)), (unsigned char)0, 20, 0);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4448);
    t3 = (t0 + 3568U);
    t6 = (t0 + 3744U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t7 = *((int *)t3);
    t23 = (t7 + 1);
    t2 = (t0 + 5280);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t23;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

}


extern void work_a_3018449010_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3018449010_2372691052_p_0,(void *)work_a_3018449010_2372691052_p_1};
	xsi_register_didat("work_a_3018449010_2372691052", "isim/tb_tan_comb_new_version_isim_beh.exe.sim/work/a_3018449010_2372691052.didat");
	xsi_register_executes(pe);
}
