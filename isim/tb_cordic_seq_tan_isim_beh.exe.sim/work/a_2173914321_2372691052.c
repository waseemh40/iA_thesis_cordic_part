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
static const char *ng0 = "/home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_seq_tan.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1701011461141789389_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_2173914321_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 6104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4736);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 6104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4736);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2173914321_2372691052_p_1(char *t0)
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

LAB0:    xsi_set_current_line(113, ng0);

LAB3:    t1 = (1 * 1000LL);
    t2 = (t0 + 6168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 3568U);
    t8 = *((char **)t7);
    t9 = *((int64 *)t8);
    t7 = (t0 + 6168);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t7, 0U, 1, t9);
    t14 = (t0 + 6168);
    xsi_driver_intertial_reject(t14, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2173914321_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(114, ng0);

LAB3:    t1 = (t0 + 3568U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t1 = (t0 + 6232);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t3);
    t8 = (t0 + 6232);
    xsi_driver_intertial_reject(t8, t3, t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2173914321_2372691052_p_3(char *t0)
{
    char t12[16];
    char t15[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    int64 t8;
    int64 t9;
    int t10;
    int t11;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;

LAB0:    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 10496);
    *((int *)t2) = 0;
    t3 = (t0 + 10500);
    *((int *)t3) = 1800;
    t4 = 0;
    t5 = 1800;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(123, ng0);
    t6 = (t0 + 3568U);
    t7 = *((char **)t6);
    t8 = *((int64 *)t7);
    t9 = (5 * t8);
    t6 = (t0 + 5480);
    xsi_process_wait(t6, t9);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB6:    t2 = (t0 + 10496);
    t4 = *((int *)t2);
    t3 = (t0 + 10500);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB31:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 10496);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 10504);
    *((int *)t2) = 0;
    t3 = (t0 + 10508);
    *((int *)t3) = 75;
    t10 = 0;
    t11 = 75;

LAB12:    if (t10 <= t11)
        goto LAB13;

LAB15:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t8 = *((int64 *)t3);
    t2 = (t0 + 5480);
    xsi_process_wait(t2, t8);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(127, ng0);
    t6 = (t0 + 2472U);
    t7 = *((char **)t6);
    t6 = (t0 + 10072U);
    t13 = (t0 + 10512);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 31;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (31 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t12, t7, t6, t13, t15);
    t20 = (t0 + 6296);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t17, 32U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 10088U);
    t6 = (t0 + 10544);
    t13 = (t15 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 0;
    t14 = (t13 + 4U);
    *((int *)t14) = 31;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t18 = (31 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t19;
    t14 = ieee_p_1242562249_sub_1701011461141789389_1035706684(IEEE_P_1242562249, t12, t3, t2, t6, t15);
    t16 = (t0 + 6360);
    t17 = (t16 + 56U);
    t20 = *((char **)t17);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t14, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 10504);
    t18 = *((int *)t2);
    t25 = (t18 == 10);
    if (t25 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 6424);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t13 = *((char **)t7);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB17:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3568U);
    t3 = *((char **)t2);
    t8 = *((int64 *)t3);
    t2 = (t0 + 5480);
    xsi_process_wait(t2, t8);

LAB21:    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB14:    t2 = (t0 + 10504);
    t10 = *((int *)t2);
    t3 = (t0 + 10508);
    t11 = *((int *)t3);
    if (t10 == t11)
        goto LAB15;

LAB23:    t18 = (t10 + 1);
    t10 = t18;
    t6 = (t0 + 10504);
    *((int *)t6) = t10;
    goto LAB12;

LAB16:    xsi_set_current_line(130, ng0);
    t3 = (t0 + 6424);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB17;

LAB19:    goto LAB14;

LAB20:    goto LAB19;

LAB22:    goto LAB20;

LAB24:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t25 = *((unsigned char *)t3);
    t26 = (t25 == (unsigned char)0);
    if (t26 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(147, ng0);

LAB29:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 6552);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 6616);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB6;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 5480);
    t6 = (t0 + 4280U);
    t7 = (t0 + 1032U);
    t13 = *((char **)t7);
    t7 = (t0 + 10008U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t13, t7);
    std_textio_write6(STD_TEXTIO, t2, t6, ((double)(t10)), (unsigned char)0, 16, 0);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 5480);
    t3 = (t0 + 3896U);
    t6 = (t0 + 4280U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 5480);
    t3 = (t0 + 4280U);
    t6 = (t0 + 1192U);
    t7 = *((char **)t6);
    t6 = (t0 + 10024U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t10)), (unsigned char)0, 16, 0);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 5480);
    t3 = (t0 + 4000U);
    t6 = (t0 + 4280U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 5480);
    t3 = (t0 + 4280U);
    t6 = (t0 + 2152U);
    t7 = *((char **)t6);
    t6 = (t0 + 10056U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t6);
    std_textio_write6(STD_TEXTIO, t2, t3, ((double)(t10)), (unsigned char)0, 20, 0);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 5480);
    t3 = (t0 + 4104U);
    t6 = (t0 + 4280U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t6);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t10 = *((int *)t3);
    t11 = (t10 + 1);
    t2 = (t0 + 6488);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    *((int *)t14) = t11;
    xsi_driver_first_trans_fast(t2);
    goto LAB29;

}


extern void work_a_2173914321_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2173914321_2372691052_p_0,(void *)work_a_2173914321_2372691052_p_1,(void *)work_a_2173914321_2372691052_p_2,(void *)work_a_2173914321_2372691052_p_3};
	xsi_register_didat("work_a_2173914321_2372691052", "isim/tb_cordic_seq_tan_isim_beh.exe.sim/work/a_2173914321_2372691052.didat");
	xsi_register_executes(pe);
}
